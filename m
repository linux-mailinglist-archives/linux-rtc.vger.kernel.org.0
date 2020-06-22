Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DFC820346B
	for <lists+linux-rtc@lfdr.de>; Mon, 22 Jun 2020 12:03:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728116AbgFVKDf (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 22 Jun 2020 06:03:35 -0400
Received: from mail-eopbgr1320044.outbound.protection.outlook.com ([40.107.132.44]:38144
        "EHLO APC01-PU1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726898AbgFVKDd (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Mon, 22 Jun 2020 06:03:33 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mfG8SlCVPhzsIVUjZfpjzfzHigS8pT6aws5OFOr1oTBUf2x6Kb/TJ8mPoWgIiGPLSIR/0y/lGKbtUDa2nkv33yUoesDldmXuts04vuLzzio24D7uQdUapGy1A1jhubMwYYm3ggOkgy88DCEa4sMEUp44sJRnFpihodp9Gmjfc2qym8Bbr+WMkGk3lneyylumKoKyQ890arv/oFhE8jeFSWt0X+n2XUNQgUSKT2PBeFE1KVnAMXGm7eLFvJg3/j9UUF6uh6JMgtp2lzSPLfo5K9UPtBQMqqiJSFT83wJsKzqU9b9E2JzJGUsvWWbPAMPfEkEJw9h23XWZyyA5kvlP1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YRVd2eUuzMtB+96qfIGRAkQjXSg15Wl8LXHYRc8Unss=;
 b=DRC/RY2uXylti4ESjnLEvXho0vdwd4tuO1ooArehGBBFoce0vQi2Wfx83u5DKXguq958DlbhcvR4VE0hNxnfAvSEyAnZvLIlI8S3vU35mhxsDFnL+ecds9kqmCbtRnC0zI5SU50ihRPQHGOV2YtVlVKWmYnIk9YYhQG4ptzm9LGYpS3LDoITlcXxCjJZLn3yzIgRpIBEetUEJdv+02DgtUsBYXqPqwzPRDb1E/d+cGTAScl6IffxvuXJp7vlrWWGcI0cc873Bg9Fl+P3M6EsIs5QShRu/oCSoadNcoUn7KT0YFkNtq3Vh8mhh3AYoBk4zHt0ufSvnF8slJnVDWIvnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=moxa.com; dmarc=pass action=none header.from=moxa.com;
 dkim=pass header.d=moxa.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moxa.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YRVd2eUuzMtB+96qfIGRAkQjXSg15Wl8LXHYRc8Unss=;
 b=PQoB7WjTgBtsRG3zV47WpK6rpyS3/hdJEK2zZ+GjWmmdwf/xCSYkhV+mt8OOIBzw30M+IeGiQav/TsfxQH5iYON+EaBpCM0k/h0KzFyy1jihEYyXgeAErOEfjga+Ig+P3sIl6ZRB5fvlXhUZX3/I12rBw1WJZAvqKikwymccGcI=
Received: from HK2PR01MB3281.apcprd01.prod.exchangelabs.com
 (2603:1096:202:22::12) by HK2PR01MB3217.apcprd01.prod.exchangelabs.com
 (2603:1096:202:24::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Mon, 22 Jun
 2020 10:03:27 +0000
Received: from HK2PR01MB3281.apcprd01.prod.exchangelabs.com
 ([fe80::712b:170d:f873:68a3]) by HK2PR01MB3281.apcprd01.prod.exchangelabs.com
 ([fe80::712b:170d:f873:68a3%6]) with mapi id 15.20.3109.027; Mon, 22 Jun 2020
 10:03:27 +0000
From:   =?big5?B?Sm9obnNvbiBDSCBDaGVuICizr6xMvrEp?= 
        <JohnsonCH.Chen@moxa.com>
To:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC:     "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
        Lee Jones <lee.jones@linaro.org>
Subject: [PATCH 1/3] mfd: ds1374: Introduce Dallas/Maxim DS1374 MFD core
  driver
Thread-Topic: [PATCH 1/3] mfd: ds1374: Introduce Dallas/Maxim DS1374 MFD core
  driver
Thread-Index: AQHWSHlxmpPaA0sQIkC/QuBIC/9aPw==
Date:   Mon, 22 Jun 2020 10:03:27 +0000
Message-ID: <HK2PR01MB328111AB2520315A7D4A1172FA970@HK2PR01MB3281.apcprd01.prod.exchangelabs.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=moxa.com;
x-originating-ip: [123.51.145.16]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e7845bb2-10b9-42f2-6302-08d816938237
x-ms-traffictypediagnostic: HK2PR01MB3217:
x-microsoft-antispam-prvs: <HK2PR01MB321776E1D9FB7749F8B21251FA970@HK2PR01MB3217.apcprd01.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 0442E569BC
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: M6m7K9wn6nbD9Ev0E1+afhFmqJ+1juZBy6OT7Kaf3Ihp0AYBANBIFfoWn9GL+17c9OB2BlFkqlrSymMe80xhoT2fgjnj5jp0c+6HefPmXyBwhLrdGpBfwQI+rGpGxHNjRfYh0adrkHA+IGqkhfyDLx9VNkaPQM0XqTXW2QRQCK2fMTlKOhdc9f+kLsMoWajzBhcR018nbipT2XFDpP0Jz/qZ1RH1pYbbk2d5hkUFzvxgFRAbpXVSdkuHBDJ07QDFRFOuT8eIFj7fe/kCqb0NYsLdvc4ouo+Ad0lvJ6NU5gZZxxGW8RheyFx0ric3RieWhr4HiYOIYycinnRDgz/48Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HK2PR01MB3281.apcprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(366004)(346002)(396003)(376002)(39850400004)(186003)(85182001)(6506007)(26005)(8936002)(6916009)(7696005)(8676002)(71200400001)(4326008)(83380400001)(316002)(2906002)(86362001)(33656002)(52536014)(9686003)(66946007)(76116006)(64756008)(55016002)(54906003)(5660300002)(478600001)(66446008)(66556008)(66476007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: OWPyVmRYqOsF3pcLAjHhu4Mmx59L6qSzbIukG3IKvX5bftu+WsdQgyfhVRoe9D4kXMUCAKPhxJpEh8shHjE4oHo8wHFmZ9AnLQ3+OYOr1c7oylqMuubmCwscRFcy9uD8j6T8xx86BmMfl8P3vfNNRH3DzxRvAk4jUbs8DWyphX3vJbiuDtoE97zBWgCTQofRjei6CBshtks6pSaRqeMqS+qxCm1tYj8yr4KsMdNUFPKNzripndXlv6YR/jMIlCmNlEXaZM7PuDm2BZrvEIp5GqLz3GqNKQC6140oSF7TnEL/OgT5oOML4N23JoaXIDj6idxbA3y1xjMDK3X3AK6LnuW2/P2WoPCCrkW8ROSuOfdmk7r3lXHlWsEry8mPgoTAKhMAshNK7CJptLo4wV0sRyCCCAty0BRf+AQ/67sR4lHRV87D5304t+Ldi7oKNOdg4zPjZ9JWZ4JyuTYjDK6/cVxK1fD8jK+yAx1uW2iNwfI=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: moxa.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7845bb2-10b9-42f2-6302-08d816938237
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jun 2020 10:03:27.1967
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5571c7d4-286b-47f6-9dd5-0aa688773c8e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GWhYuFitC/YwWEvIVaLm0TZxPYiaA85rMPbvQDZong6NavTLpuLsLyQzYYMcjm/l3R9zNDJHWcojzYR2ZyjN4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR01MB3217
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

RGFsbGFzL01heGltIERTMTM3NCBpcyBhIGNvdW50ZXIgZGVzaWduZWQgdG8gY29udGludW91c2x5
IGNvdW50CnRpbWUgaW4gc2Vjb25kcy4gSXQgcHJvdmlkZXMgYW4gSTJDIGludGVyZmFjZSB0byB0
aGUgaG9zdCB0bwphY2Nlc3MgUlRDIGNsb2NrIG9yIEFsYXJtL1dhdGNoZG9nIHRpbWVyLgoKQWRk
IE1GRCBDb3JlIGRyaXZlciwgc3VwcG9ydGluZyB0aGUgSTJDIGNvbW11bmljYXRpb24gdG8gUlRD
IGFuZApXYXRjaGRvZyBkZXZpY2VzLgoKU2lnbmVkLW9mZi1ieTogSm9obnNvbiBDaGVuIDxqb2hu
c29uY2guY2hlbkBtb3hhLmNvbT4KLS0tCiBkcml2ZXJzL21mZC9LY29uZmlnICB8ICAxMSArKysr
KwogZHJpdmVycy9tZmQvTWFrZWZpbGUgfCAgIDIgKwogZHJpdmVycy9tZmQvZHMxMzc0LmMgfCAx
MDEgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogMyBmaWxlcyBj
aGFuZ2VkLCAxMTQgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvbWZk
L2RzMTM3NC5jCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZmQvS2NvbmZpZyBiL2RyaXZlcnMvbWZk
L0tjb25maWcKaW5kZXggNjg3ZTljODQ4MDUzLi5kMTYwMzFmNGI0ODcgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvbWZkL0tjb25maWcKKysrIGIvZHJpdmVycy9tZmQvS2NvbmZpZwpAQCAtMTk4MCw2ICsx
OTgwLDE3IEBAIGNvbmZpZyBNRkRfU1RNMzJfTFBUSU1FUgogCSAgVG8gY29tcGlsZSB0aGlzIGRy
aXZlciBhcyBhIG1vZHVsZSwgY2hvb3NlIE0gaGVyZTogdGhlCiAJICBtb2R1bGUgd2lsbCBiZSBj
YWxsZWQgc3RtMzItbHB0aW1lci4KIAorY29uZmlnIE1GRF9EUzEzNzQKKwl0cmlzdGF0ZSAiU3Vw
cG9ydCBmb3IgRGFsbGFzL01heGltIERTMTM3NCIKKwlkZXBlbmRzIG9uIEkyQworCXNlbGVjdCBN
RkRfQ09SRQorCWhlbHAKKwkgIFNheSB5ZXMgaGVyZSB0byBhZGQgc3VwcG9ydCBmb3IgRGFsbGFz
L01heGltIERTMTM3NCBTZW1pY29uZHVjdG9yLgorCSAgVGhpcyBkcml2ZXIgcHJvdmlkZXMgUlRD
IGFuZCB3YXRjaGRvZy4KKworCSAgVGhpcyBkcml2ZXIgY2FuIGFsc28gYmUgYnVpbHQgYXMgYSBt
b2R1bGUuIElmIHNvLCBtb2R1bGUgd2lsbCBiZQorCSAgY2FsbGVkIGRzMTM3NC4KKwogY29uZmln
IE1GRF9TVE0zMl9USU1FUlMKIAl0cmlzdGF0ZSAiU3VwcG9ydCBmb3IgU1RNMzIgVGltZXJzIgog
CWRlcGVuZHMgb24gKEFSQ0hfU1RNMzIgJiYgT0YpIHx8IENPTVBJTEVfVEVTVApkaWZmIC0tZ2l0
IGEvZHJpdmVycy9tZmQvTWFrZWZpbGUgYi9kcml2ZXJzL21mZC9NYWtlZmlsZQppbmRleCBiZWEy
YmU0MTk4MjIuLmE2NDYzZGQ0YWEzMyAxMDA2NDQKLS0tIGEvZHJpdmVycy9tZmQvTWFrZWZpbGUK
KysrIGIvZHJpdmVycy9tZmQvTWFrZWZpbGUKQEAgLTI0Myw2ICsyNDMsOCBAQCBvYmotJChDT05G
SUdfSU5URUxfU09DX1BNSUNfQ0hUV0MpCSs9IGludGVsX3NvY19wbWljX2NodHdjLm8KIG9iai0k
KENPTkZJR19JTlRFTF9TT0NfUE1JQ19DSFREQ19USSkJKz0gaW50ZWxfc29jX3BtaWNfY2h0ZGNf
dGkubwogbXQ2Mzk3LW9ianMJOj0gbXQ2Mzk3LWNvcmUubyBtdDYzOTctaXJxLm8KIG9iai0kKENP
TkZJR19NRkRfTVQ2Mzk3KQkrPSBtdDYzOTcubworb2JqLSQoQ09ORklHX01GRF9EUzEzNzQpIAkr
PSBkczEzNzQubworCiBvYmotJChDT05GSUdfSU5URUxfU09DX1BNSUNfTVJGTEQpCSs9IGludGVs
X3NvY19wbWljX21yZmxkLm8KIAogb2JqLSQoQ09ORklHX01GRF9BTFRFUkFfQTEwU1IpCSs9IGFs
dGVyYS1hMTBzci5vCmRpZmYgLS1naXQgYS9kcml2ZXJzL21mZC9kczEzNzQuYyBiL2RyaXZlcnMv
bWZkL2RzMTM3NC5jCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMC4uNmU5
MDQxYWJhNWQyCi0tLSAvZGV2L251bGwKKysrIGIvZHJpdmVycy9tZmQvZHMxMzc0LmMKQEAgLTAs
MCArMSwxMDEgQEAKKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wCisvKgorICog
IE1hbWltL0RhbGxhcyBEUzEzNzQgTUZEIENvcmUgRHJpdmVyLgorICoKKyAqICBDb3B5cmlnaHQg
KEMpIDIwMjAgSm9obnNvbiBDaGVuIDxqb2huc29uY2guY2hlbkBtb3hhLmNvbT4KKyAqLworCisj
aW5jbHVkZSA8bGludXgva2VybmVsLmg+CisjaW5jbHVkZSA8bGludXgvZGV2aWNlLmg+CisjaW5j
bHVkZSA8bGludXgvbW9kdWxlLmg+CisjaW5jbHVkZSA8bGludXgvaTJjLmg+CisjaW5jbHVkZSA8
bGludXgvbWZkL2NvcmUuaD4KKworCitzdGF0aWMgc3RydWN0IG1mZF9jZWxsIGRzMTM3NF9jZWxs
W10gPSB7CisJeyAubmFtZSA9ICJkczEzNzRfcnRjIiwgfSwKKwl7IC5uYW1lID0gImRzMTM3NF93
ZHQiLCB9LAorfTsKKworc3RhdGljIGludCBkczEzNzRfcHJvYmUoc3RydWN0IGkyY19jbGllbnQg
KmNsaWVudCwKKwkJCWNvbnN0IHN0cnVjdCBpMmNfZGV2aWNlX2lkICppZCkKK3sKKwlpbnQgcmV0
OworCisJcmV0ID0gaTJjX2NoZWNrX2Z1bmN0aW9uYWxpdHkoY2xpZW50LT5hZGFwdGVyLAorCQkJ
CSAgICAgIEkyQ19GVU5DX1NNQlVTX0JZVEVfREFUQSB8CisJCQkJICAgICAgSTJDX0ZVTkNfU01C
VVNfV09SRF9EQVRBIHwKKwkJCQkgICAgICBJMkNfRlVOQ19TTUJVU19CWVRFKTsKKwlpZiAoIXJl
dCkKKwkJcmV0dXJuIC1FTk9ERVY7CisKKwlyZXQgPSBkZXZtX21mZF9hZGRfZGV2aWNlcygmY2xp
ZW50LT5kZXYsIDAsIGRzMTM3NF9jZWxsLAorCQkJCSAgIEFSUkFZX1NJWkUoZHMxMzc0X2NlbGwp
LCBOVUxMLCAwLCBOVUxMKTsKKworCWlmIChyZXQgPCAwKSB7CisJCWRldl9lcnIoJmNsaWVudC0+
ZGV2LCAiZmFpbGVkIHRvIGFkZCBEUzEzNzQgc3ViLWRldmljZXNcbiIpOworCQlyZXR1cm4gcmV0
OworCX0KKworCXJldHVybiAwOworfQorCitzdGF0aWMgaW50IGRzMTM3NF9yZW1vdmUoc3RydWN0
IGkyY19jbGllbnQgKmNsaWVudCkKK3sKKwltZmRfcmVtb3ZlX2RldmljZXMoJmNsaWVudC0+ZGV2
KTsKKworCXJldHVybiAwOworfQorCisjaWZkZWYgQ09ORklHX1BNX1NMRUVQCitzdGF0aWMgaW50
IGRzMTM3NF9zdXNwZW5kKHN0cnVjdCBkZXZpY2UgKmRldikKK3sKKwlzdHJ1Y3QgaTJjX2NsaWVu
dCAqY2xpZW50ID0gdG9faTJjX2NsaWVudChkZXYpOworCisJaWYgKGNsaWVudC0+aXJxID4gMCAm
JiBkZXZpY2VfbWF5X3dha2V1cCgmY2xpZW50LT5kZXYpKQorCQllbmFibGVfaXJxX3dha2UoY2xp
ZW50LT5pcnEpOworCXJldHVybiAwOworfQorCitzdGF0aWMgaW50IGRzMTM3NF9yZXN1bWUoc3Ry
dWN0IGRldmljZSAqZGV2KQoreworCXN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQgPSB0b19pMmNf
Y2xpZW50KGRldik7CisKKwlpZiAoY2xpZW50LT5pcnEgPiAwICYmIGRldmljZV9tYXlfd2FrZXVw
KCZjbGllbnQtPmRldikpCisJCWRpc2FibGVfaXJxX3dha2UoY2xpZW50LT5pcnEpOworCXJldHVy
biAwOworfQorI2VuZGlmCisKK3N0YXRpYyBjb25zdCBzdHJ1Y3QgaTJjX2RldmljZV9pZCBkczEz
NzRfaWRbXSA9IHsKKwl7ICJkczEzNzQiLCAwIH0sCisJeyB9Cit9OworTU9EVUxFX0RFVklDRV9U
QUJMRShpMmMsIGRzMTM3NF9pZCk7CisKKyNpZmRlZiBDT05GSUdfT0YKK3N0YXRpYyBjb25zdCBz
dHJ1Y3Qgb2ZfZGV2aWNlX2lkIGRzMTM3NF9vZl9tYXRjaFtdID0geworCXsgLmNvbXBhdGlibGUg
PSAiZGFsbGFzLGRzMTM3NCIgfSwKKwl7IH0KK307CitNT0RVTEVfREVWSUNFX1RBQkxFKG9mLCBk
czEzNzRfb2ZfbWF0Y2gpOworI2VuZGlmCisKK3N0YXRpYyBTSU1QTEVfREVWX1BNX09QUyhkczEz
NzRfcG0sIGRzMTM3NF9zdXNwZW5kLCBkczEzNzRfcmVzdW1lKTsKKworc3RhdGljIHN0cnVjdCBp
MmNfZHJpdmVyIGRzMTM3NF9kcml2ZXIgPSB7CisJLmRyaXZlciAgICAgICAgICAgICAgICAgPSB7
CisJCS5uYW1lICAgICAgICAgICA9ICJkczEzNzQiLAorCQkub2ZfbWF0Y2hfdGFibGUgPSBvZl9t
YXRjaF9wdHIoZHMxMzc0X29mX21hdGNoKSwKKwkJLnBtICAgICAgICAgICAgID0gJmRzMTM3NF9w
bSwKKwl9LAorCS5wcm9iZSAgICAgICAgICA9IGRzMTM3NF9wcm9iZSwKKwkucmVtb3ZlCSAgICAg
ICAgPSBkczEzNzRfcmVtb3ZlLAorCS5pZF90YWJsZSAgICAgICA9IGRzMTM3NF9pZCwKK307CisK
K21vZHVsZV9pMmNfZHJpdmVyKGRzMTM3NF9kcml2ZXIpOworCitNT0RVTEVfREVTQ1JJUFRJT04o
IkRhbGxhcy9NYXhpbSBEUzEzNzQgTUZEIENvcmUgRHJpdmVyIik7CitNT0RVTEVfQVVUSE9SKCJK
b2huc29uIENoZW4gPGpvaG5zb25jaC5jaGVuQG1veGEuY29tPiIpOworTU9EVUxFX0xJQ0VOU0Uo
IkdQTCIpOwotLSAKMi4yMC4xCg==
