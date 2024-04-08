# nessus-agent-iplookup

## Usage:

Öncelikle config dosyasında düzenleme yapmalısınız.

```bash
# cat config.ini
[settings]
url=https://10.10.10.124:8834
username=nessusadminuser
password=P4ssw0rd!!
accesskey=b5a8cebfb7bc3defb7471852a41895f5955aaaa4d3c901d432c0f51516400e85
secretkey=8c3207adff7692f7e516bf217796893c55cee2a530234506ee4a1d5696e8127d
```

Aşağıdaki script tenable.sc makinasında çalıştırılmalıdır. Çalıştırıldığı an itibariyle son 5 dakikaya ait log akışı kontrol edilir. Burada geçen <scan-name> ile aynı olan <group> içerisindeki <nessus-agent>'lara ait <ip> adresi bilgilerini listeler.

* Tenable.sc'de Agent Scan Name ile Group Name eş olmalıdır.

```bash
[root@tenable-5cfxx56r nessus-agent-iplookup]# ./get-ips.sh
logfile: /opt/sc/admin/logs/202404.log
08 Apr 2024 13:42
08 Apr 2024 13:41
08 Apr 2024 13:40
08 Apr 2024 13:39
10.10.10.122
08 Apr 2024 13:38

```

Sadece Agent grup isimlerini alan script çağrısı:
```bash
# ./get-agent-groups.sh
{
  "groups": [
    {
      "agents_count": 1,
      "name": "aliokantest",
      "owner_name": "system",
      "owner": "nessus_ms_agent",
      "shared": 1,
      "user_permissions": 128,
      "timestamp": 1712568703,
      "last_modification_date": 1712568703,
      "creation_date": 1712568033,
      "owner_id": 1,
      "id": 4
    }
  ]
}
```

Nessus Agent group name i parametre olarak verip group id bilgisini öğrenme:

```bash
# ./get-agent-group-id.sh "aliokantest"
4
```

Nessus Agent group id bilgisini parametre olarak vererek group içerisindeki agent'ların ip bilgilerini getiren script çağrısı:
```bash
# ./get-agent-ips.sh 4
10.10.10.122
```

