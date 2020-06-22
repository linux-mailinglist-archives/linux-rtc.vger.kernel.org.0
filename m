Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C957203468
	for <lists+linux-rtc@lfdr.de>; Mon, 22 Jun 2020 12:03:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727012AbgFVKD3 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 22 Jun 2020 06:03:29 -0400
Received: from mail-eopbgr1320044.outbound.protection.outlook.com ([40.107.132.44]:38144
        "EHLO APC01-PU1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726898AbgFVKD3 (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Mon, 22 Jun 2020 06:03:29 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mxPe+bnmlo/3jsHCYeH6KNti5x+NajJwC0kTC0gasQDp+Ob0uFs8UCXcJ9PXEHkq5XpPFJfg/lIUIe2/n7on+rVsbo3Q32yEfBEJedW1U/ssHBPsjgQ2to3VStsNf2vivaV3ez411Ng3dq7w+jUSGakr848YrDWoDxdQyjq7SI22+vka71sKY4vGrlOf4zU4a3Djf+c7kJ3umlMHF9rB9C1tbYitkJwl3haro4KjkcDDggGth8c93MP3Ljem7kMkFH2IkrGR/0TAI71hJIvrXLA7gzyCaNJfISGlo/i3XAXnGI7eWepeExER0nFFy+YrC7Jtt3ijpYrV0DP3qx56CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=52apssC4otua/CVCCdZPkxtkXa4DFoOmbThtVqQRDT0=;
 b=gSMiRJa2Pz8tJ9MuiAIU7H5qnNg6GRBoCYOd6UV0A54xL/pHC9sKv4mcDWyrfMzEbEpHjgnLgOvrRu5MTm1QUvD2c+pXdJDmQc0ymiUu6l60Nz7U7SbP/Y53IKn0TVT8bdIWNioWvvzXIyfuRVO0Ta6o13HrRs/7CeYsrqfo8pxIfImqKvyuWX86fZKvekkGImH5MG1MX/u53RogSe6H8myqIgP97Xnge0FQRhr1BMBc2wI9X2zm+uOVtBZa+XAl7NiNw3jCmeTaX/txYPTwll0uziEx2lPEbnfXgb04N/cDLGQ3mioZC3Dn3UX8QOJeJA41DiIctOrpiMNyMJ6xGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=moxa.com; dmarc=pass action=none header.from=moxa.com;
 dkim=pass header.d=moxa.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moxa.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=52apssC4otua/CVCCdZPkxtkXa4DFoOmbThtVqQRDT0=;
 b=f0rnTYI3CfemgBt7CCNNLvnS+9Br9apjeIZGyxEtSZPXdGVn+OqcGUuLrhu2Q8RKR/95Yqc5+14/rKRD1p8N4WDlkHCydPHc0DdeMqA5eWDXwEl3LeUxtpuyLdoYepO8hx8I/ulzW8mtkSVKKniL3/ieu5pxbmpOvAePimAWxHo=
Received: from HK2PR01MB3281.apcprd01.prod.exchangelabs.com
 (2603:1096:202:22::12) by HK2PR01MB3217.apcprd01.prod.exchangelabs.com
 (2603:1096:202:24::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Mon, 22 Jun
 2020 10:03:25 +0000
Received: from HK2PR01MB3281.apcprd01.prod.exchangelabs.com
 ([fe80::712b:170d:f873:68a3]) by HK2PR01MB3281.apcprd01.prod.exchangelabs.com
 ([fe80::712b:170d:f873:68a3%6]) with mapi id 15.20.3109.027; Mon, 22 Jun 2020
 10:03:25 +0000
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
Subject: [PATCH 0/3] Use MFD for Dallas/Maxim DS1374 driver series
Thread-Topic: [PATCH 0/3] Use MFD for Dallas/Maxim DS1374 driver series
Thread-Index: AQHWSHk8vS8zWbAau0uFznOwrrAykg==
Date:   Mon, 22 Jun 2020 10:03:25 +0000
Message-ID: <HK2PR01MB3281DAE412911621A7F8963BFA970@HK2PR01MB3281.apcprd01.prod.exchangelabs.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=moxa.com;
x-originating-ip: [123.51.145.16]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e4c19f4d-e555-4032-51a8-08d81693810e
x-ms-traffictypediagnostic: HK2PR01MB3217:
x-microsoft-antispam-prvs: <HK2PR01MB3217E5E4447606484BFE6290FA970@HK2PR01MB3217.apcprd01.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0442E569BC
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /GTnCBOCZhBySj3o9jMS4AOp8c9mEY8JW44mBK69qR1Kc7PimZq8r5EQNU4hTxn4VYefgDZDXztH16FMz2fnGHfMb63BH+nujNy9zTaxXWwy9sHKPaJQVETe2JElGNSsR8VxCyZsOF1giajnruPlxyv1Eji8s5NMcJoCLxBxMYiugUkVB+CKrNvONSSfpGLhmzYvABX8tJxNACS0us6LsmKYzNg3g14yMcNB9irxqrqUabALaIpzRNIvRwOZwKItMbLV6pcBq2F/NODl1ed7vbjIdwzGozdNUIqfXPo2e/x7KERl03FkN7dyZbDk5PxJ
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HK2PR01MB3281.apcprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(366004)(346002)(396003)(376002)(39850400004)(186003)(85182001)(6506007)(26005)(8936002)(6916009)(7696005)(8676002)(71200400001)(4326008)(83380400001)(316002)(2906002)(86362001)(33656002)(52536014)(9686003)(66946007)(76116006)(64756008)(55016002)(54906003)(5660300002)(478600001)(66446008)(66556008)(66476007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: qRSYRA6nsRTxSGrfkkOnblq+oiatP2z3Sw55j0kulse61ELmdpKpaGOj5dn2KWRRdiBJPAUYfhu/PgX+0osSXhThIZApS3JCXp05vmI+UQnQpxo7F2QrWFKcPycV2UBPm7pUDghEs3EYwUf1V5gdV/UQk2kIbcZVypp9ATpSGBR/A8xg3gAuTTw47pqwdE07LHSJdQ7e3Cnlmt3GFpDv6fQ9P+U+Edw96r/XTWOcnXRQKm1MdxpxpZjZ1mWJ4gT9NqRC7guHbZKQvr6sUZeTOb8pSlp/flf8a6PqfZ/yXWZiT89Gr/BLK/JLi3vzrczRnpfBx3Y0/OSmGL1q43a9ioCzCDxCsJRx6Hq6gp0cxvOQRJWbvivtvX+FR0mqxaoWKplmFyc1Y3B6CUfpl2p3zbXxYTnAVmJ7sV78PxHf1L94N3MLPQNZSc1LnaCtiSy2pA2zqn3myB6J9dEbCP+Sbmc++y4yKEn4LBGkFYkpqVI=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: moxa.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4c19f4d-e555-4032-51a8-08d81693810e
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jun 2020 10:03:25.2169
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5571c7d4-286b-47f6-9dd5-0aa688773c8e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 30lVuhDVs8Jb2Tayv78PSjLJHB52zVWCX1eA4RTRuG0v4kXjsC4E1Lq5lGYmSPvTqY0ikrURGHLPXrobE6Pw6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR01MB3217
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

SGVsbG8gYWxsLAoKVGhpcyBwYXRjaCBzZXQgdXNlcyBNRkQgc3RydWN0dXJlIGZvciBEUzEzNzQg
c28gdGhhdCBSVEMgYW5kIFdhdGNoZG9nCmZ1bmN0aW9ucyBjYW4gYmUgc2VwYXJhdGVseS4gVGhl
cmVmb3JlLCB3ZSBjYW4gYWRkIG1vcmUgV2F0Y2hkb2cgCnN1YmZ1bmN0aW9ucyBoZXJlLgoKQSBE
UzEzNzQgTUZEIGNvcmUgZHJpdmVyIHN1cHBvcnRzIHRoZSBJMkMgY29tbXVuaWNhdGlvbiB0byBS
VEMgYW5kCldhdGNoZG9nIGRldmljZXMuCgoxLiBBZGQgRFMxMzc0IE1GRCBjb3JlIGRyaXZlciB3
aXRoIEkyQyBidXMuCjIuIExldCBEUzEzNzQgUlRDIGRyaXZlciBoYXMgUlRDIGFuZCBBbGFybSBm
dW5jdGlvbnMgb25seS4KMy4gQWRkIERTMTM3NCBXYXRjaGRvZyBkcml2ZXIuCgpUaGFua3MsCkpv
aG5zb24KCkpvaG5zb24gQ2hlbiAoMyk6CiAgbWZkOiBkczEzNzQ6IEludHJvZHVjZSBEYWxsYXMv
TWF4aW0gRFMxMzc0IE1GRCBjb3JlIGRyaXZlcgogIHJ0YzogcnRjLWRzMTM3NDogTW92ZSBvdXQg
V2F0Y2hkb2cgZnVuY3Rpb24gYW5kIEkyQyBjbGllbnQKICB3YXRjaGRvZzogZHMxMzc0X3dkdDog
SW50cm9kdWNlIERhbGxhcy9NYXhpbSBEUzEzNzQgV2F0Y2hkb2cgZHJpdmVyCgogZHJpdmVycy9t
ZmQvS2NvbmZpZyAgICAgICAgICAgfCAgMTEgKwogZHJpdmVycy9tZmQvTWFrZWZpbGUgICAgICAg
ICAgfCAgIDIgKwogZHJpdmVycy9tZmQvZHMxMzc0LmMgICAgICAgICAgfCAxMDEgKysrKysrKysK
IGRyaXZlcnMvcnRjL0tjb25maWcgICAgICAgICAgIHwgICA5ICstCiBkcml2ZXJzL3J0Yy9ydGMt
ZHMxMzc0LmMgICAgICB8IDQ1OCArKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiBk
cml2ZXJzL3dhdGNoZG9nL0tjb25maWcgICAgICB8ICAxMSArCiBkcml2ZXJzL3dhdGNoZG9nL01h
a2VmaWxlICAgICB8ICAgMSArCiBkcml2ZXJzL3dhdGNoZG9nL2RzMTM3NF93ZHQuYyB8IDMzMCAr
KysrKysrKysrKysrKysrKysrKysrKysKIDggZmlsZXMgY2hhbmdlZCwgNTMyIGluc2VydGlvbnMo
KyksIDM5MSBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL21mZC9kczEz
NzQuYwogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvd2F0Y2hkb2cvZHMxMzc0X3dkdC5jCgot
LSAKMi4yMC4xCg==
