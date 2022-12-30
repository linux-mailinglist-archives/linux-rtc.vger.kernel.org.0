Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF17065977E
	for <lists+linux-rtc@lfdr.de>; Fri, 30 Dec 2022 12:09:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233838AbiL3LJh (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 30 Dec 2022 06:09:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229519AbiL3LJg (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 30 Dec 2022 06:09:36 -0500
Received: from mickerik.phytec.de (mickerik.phytec.de [91.26.50.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 716022BE6
        for <linux-rtc@vger.kernel.org>; Fri, 30 Dec 2022 03:09:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
        q=dns/txt; i=@phytec.de; t=1672398573; x=1674990573;
        h=From:Sender:Reply-To:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=iqoNFoCcSjz51f2VYsdTJwPhqPDAZ4XABzZjqonxXJM=;
        b=U1N+7QxwAl4abz58izU23D36mNm4d5gxUkXJYe04O71K2RXZt2dGCgLFFqemRmMj
        stWNYUqXCeilD0HuC3qF8SqHLbDD4IwKofcN0h7kh2rtNNsAVni2ur1hMl9qf/uo
        SG/my/CPX3YXRqkhpA2f9oo07BkHelWZtI2rx6DmcQU=;
X-AuditID: ac14000a-923ff70000007ecb-db-63aec6ed87b3
Received: from berlix.phytec.de (Unknown_Domain [172.25.0.12])
        (using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (Client did not present a certificate)
        by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id 7B.CF.32459.DE6CEA36; Fri, 30 Dec 2022 12:09:33 +0100 (CET)
Received: from Berlix.phytec.de (172.25.0.12) by Berlix.phytec.de
 (172.25.0.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Fri, 30 Dec
 2022 12:09:32 +0100
Received: from Berlix.phytec.de ([fe80::61cc:ebf0:7375:8768]) by
 berlix.phytec.de ([fe80::197e:d26b:2ca:c7b4%4]) with mapi id 15.01.2375.018;
 Fri, 30 Dec 2022 12:09:32 +0100
From:   Wadim Egorov <W.Egorov@phytec.de>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        "upstream@lists.phytec.de" <upstream@lists.phytec.de>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>
CC:     "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>
Subject: Re: [PATCH] dt-bindings: rtc: Add rv3028 to rv3032.yaml dtschema
Thread-Topic: [PATCH] dt-bindings: rtc: Add rv3028 to rv3032.yaml dtschema
Thread-Index: AQHZGsbYYstGVyTlIUmATTAQTfntPK6GOBEA
Date:   Fri, 30 Dec 2022 11:09:32 +0000
Message-ID: <08d74257-5f8b-31ae-8077-2c73c1430c0a@phytec.de>
References: <20221228140610.938686-1-w.egorov@phytec.de>
 <19f62c10-de9f-88ee-70c3-279efbbcef0b@linaro.org>
In-Reply-To: <19f62c10-de9f-88ee-70c3-279efbbcef0b@linaro.org>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.25.0.11]
Content-Type: text/plain; charset="utf-8"
Content-ID: <A54824D0638CDB4895C154FFCC5CB592@phytec.de>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrPIsWRmVeSWpSXmKPExsWyRpKBR/ftsXXJBsuXcFssuXiV3aL93TJ2
        i/lHzrFa9L14yGyx9/VWdotjq6+wWbTuPcJu0f1O3YHDY96aao9NqzrZPO5c28Pm0d/dwuox
        fd5PJo/Pm+QC2KK4bFJSczLLUov07RK4Ml583c9SsEGkYuqlbewNjG+Euxg5OSQETCS2Ld7F
        3sXIxSEksJhJ4tqGh8wQzgNGifV777JBOBsZJX4d2sgO0sImoC4x8e8JVpCEiMBLRokXn/aC
        tTALvGGUuHB4JhtIlbCAp8SxdXtYQWwRAS+JrkMTGCFsI4nfzTeBajg4WARUJaZf4QAJ8wrY
        SPQtvglWIiSQI7Hgax+YzSlgJ3Gh6TILiM0oICuxYcN5ZhCbWUBcYtOz76wQPwhILNkDEZcQ
        EJV4+fgfVFxe4sStaUwgq5gFNCXW79KHaLWQuHvrDjuErSgxpfshO8QJghInZz5hmcAoPgvJ
        hlkI3bOQdM9C0j0LSfcCRtZVjEK5mcnZqUWZ2XoFGZUlqcl6KambGEGRLMLAtYOxb47HIUYm
        DsZDjBIczEoivBpnVycL8aYkVlalFuXHF5XmpBYfYpTmYFES573fw5QoJJCeWJKanZpakFoE
        k2Xi4JRqYNR9qHLviLjL2fJlDuLznmqsdOK8udtk9p5NT2dqc/9/tujVy+KZM81/PfFgtnTc
        uc3BZc+G3uo5h2xkW8Nzs/0f5Sw0mr9Ee/uCw+r/vjEEr5jMc1hn+Vx3GY6giAdGKT+fVXvE
        Z+Rcesa1XkQhVfXxNNW3tg/WvS/v8NKoL1tlnLBs1deDt72UWIozEg21mIuKEwEY9VUB0gIA
        AA==
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

QW0gMjguMTIuMjIgdW0gMTU6MTUgc2NocmllYiBLcnp5c3p0b2YgS296bG93c2tpOg0KPiBZb3Vy
IHN1YmplY3QgaXMgYSBiaXQgaW5jb3JyZWN0LiBZb3UgZG8gbm90IGFkZCBydjMwMjggdG8gcnYz
MDMyLnlhbWwuDQo+IEFsc28gZHJvcCByZWR1bmRhbnQgImR0c2NoZW1hIi4gSW5zdGVhZCAiRXh0
ZW5kIHJ2MzAyOCBiaW5kaW5ncyINCj4NCj4NCj4gT24gMjgvMTIvMjAyMiAxNTowNiwgV2FkaW0g
RWdvcm92IHdyb3RlOg0KPj4gTW92ZSBSVjMwMjggUlRDIGJpbmRpbmdzIGZyb20gdHJpdmlhbC1y
dGMueWFtbCBpbnRvIG1pY3JvY3J5c3RhbCxydjMwMzIueWFtbC4NCj4+IFJWMzAyOCBjYW4gaGF2
ZSBhIHRyaWNrbGUtcmVzaXRvci1vaG1zIHByb3BlcnR5LiBNYWtlIGl0IGtub3duIHRvIGR0c2No
ZW1hLg0KPiBJIGRvbid0IHVuZGVyc3RhbmQgd2hhdCBpcyBoZXJlIG1hZGUga25vd24gdG8gZHRz
Y2hlbWEsIHNvIG1heWJlIGRyb3ANCj4gbGFzdCBzZW50ZW5jZS4NCj4NCj4+IFNpZ25lZC1vZmYt
Ynk6IFdhZGltIEVnb3JvdiA8dy5lZ29yb3ZAcGh5dGVjLmRlPg0KPj4gLS0tDQo+PiAgIC4uLi9i
aW5kaW5ncy9ydGMvbWljcm9jcnlzdGFsLHJ2MzAyOC55YW1sICAgICB8IDU2ICsrKysrKysrKysr
KysrKysrKysNCj4+ICAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvcnRjL3RyaXZpYWwtcnRjLnlh
bWwgIHwgIDIgLQ0KPj4gICAyIGZpbGVzIGNoYW5nZWQsIDU2IGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0pDQo+PiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvcnRjL21pY3JvY3J5c3RhbCxydjMwMjgueWFtbA0KPj4NCj4+IGRpZmYgLS1n
aXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcnRjL21pY3JvY3J5c3RhbCxy
djMwMjgueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ydGMvbWljcm9j
cnlzdGFsLHJ2MzAyOC55YW1sDQo+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPj4gaW5kZXggMDAw
MDAwMDAwMDAwLi40YWJlNDc1NmJjOWINCj4+IC0tLSAvZGV2L251bGwNCj4+ICsrKyBiL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ydGMvbWljcm9jcnlzdGFsLHJ2MzAyOC55YW1s
DQo+PiBAQCAtMCwwICsxLDU2IEBADQo+PiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BM
LTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZQ0KPj4gKyVZQU1MIDEuMg0KPj4gKy0tLQ0KPj4gKyRp
ZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvcnRjL21pY3JvY3J5c3RhbCxydjMwMjgu
eWFtbCMNCj4+ICskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2Nv
cmUueWFtbCMNCj4+ICsNCj4+ICt0aXRsZTogTWljcm9jaGlwIFJWLTMwMjggUlRDDQo+PiArDQo+
PiArYWxsT2Y6DQo+PiArICAtICRyZWY6ICJydGMueWFtbCMiDQo+IERyb3AgcXVvdGVzLg0KPg0K
Pj4gKw0KPj4gK21haW50YWluZXJzOg0KPj4gKyAgLSBBbGV4YW5kcmUgQmVsbG9uaSA8YWxleGFu
ZHJlLmJlbGxvbmlAYm9vdGxpbi5jb20+DQo+IFRoaXMgc2hvdWxkIG5vdCBiZSBtYWludGFpbmVy
IG9mIHN1YnN5c3RlbSBidXQgbWFpbnRhaW5lciBvZiBkZXZpY2UNCj4gKHVubGVzcyBpdCBpcyB0
aGUgc2FtZSBwZXJzb24/KS4NCj4NCkhpIEtyenlzenRvZiwNCg0Kd2hvIHdvdWxkIGJlIHRoZSBt
YWludGFpbmVyIGZvciB0aGlzIFJUQz8NCkkgYW0gbm90IGFibGUgdG8gZmluZCBhIG1haW50YWlu
ZXIuDQoNCkNhbiBJIGtlZXAgQWxleGFuZHJlIEJlbGxvbmkgYXMgdGhlIG1haW50YWluZXIgc2lu
Y2UgdGhlcmUgc2VlbSB0byBiZSBubyANCm1haW50YWluZXIgZm9yIHRoZSBSVjMwMjggUlRDLg0K
DQpSZWdhcmRzLA0KV2FkaW0NCg0KDQo=
