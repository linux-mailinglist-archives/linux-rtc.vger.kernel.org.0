Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D1A8A716A07
	for <lists+linux-rtc@lfdr.de>; Tue, 30 May 2023 18:49:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229971AbjE3QtG (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 30 May 2023 12:49:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229680AbjE3QtF (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 30 May 2023 12:49:05 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2116.outbound.protection.outlook.com [40.107.114.116])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FFE498;
        Tue, 30 May 2023 09:49:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UM36zr7PXzzicd2F+zQosJzQ5biFGzzMCy6U9/pilleRpS5PxQHKgveJr0wneIAKXk8Botd4ak1p5tY+aCh8zrw6SjcvQC6equTYg6n30UHLncVUaBCe4u7ZZnFOBmMCsE0WLDylaAtvjRAvxiyHt3UfpfTaZ6vJ04TdUSCdWJTurW2MAtcSzYyKoOilPiY1EVd1fFF4JTbW4qYY3ilI3TBMjA1xqcOnaRFWiSuhWdKnpDwEEZgzzDZKjUeGkIJVPrThDVeXMpbLNnNaYQZ3P0TiQ0kURY8fqmUxS2FqM+IjQbC3urfuJ4ReVIi7EjU8LMGq+7u4JVHOFPOFaRO/Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pTtf1iesBCu6CerCqKXgX5nZ732jUC0PpKiNMORGe2A=;
 b=CQ4egtupbU4+TZBnZbzu6JLGZ7I+Tlpsgn/1pggtI3lv65vufLw7eSpZ15S+3Frs+WouqexI4sATUujsnml5cwLQSDDPNYiX5J+hhbFb4U91r55J3i1GYukNbdSUQFtCYwHFjUUGYR/SE6YKVlpZrgw0t7nc8gkwIbZysvJWtpyo5qqjKwwfA8xXkA5VwCxqdGb+0uE3fRn1enP9TEphJseKse9uiljibLRtXZ4YxElYC3edY/nJTlDS53K6tFiOW4i34CYvJ/0p6Z30yrpWmIPdQ0tgOmDCMudRtR2EuLirj1Exu2F9fI+aEuo+Sc4PdT4kGH1EAnqhi0us3qBVtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pTtf1iesBCu6CerCqKXgX5nZ732jUC0PpKiNMORGe2A=;
 b=gFkJ7OSdBNTCcfHaqUdJU6pgO85WLnuadf2SRNhjry2vcSJZgmHdHQiqmex0MLN3biQvpU2hypXCNSQn0fIO+Cf6PFlYCaJ/LkS8RPX29V5S63GjSqX5qM7SmpKTe9XEnoD4tNiNuFSYLf03q9UI487ylhuIuuMyjNP0CGtHGzc=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYWPR01MB10427.jpnprd01.prod.outlook.com (2603:1096:400:24f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.24; Tue, 30 May
 2023 16:48:57 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2%6]) with mapi id 15.20.6455.020; Tue, 30 May 2023
 16:48:57 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v5 07/11] rtc: isl1208: Add isl1208_set_xtoscb()
Thread-Topic: [PATCH v5 07/11] rtc: isl1208: Add isl1208_set_xtoscb()
Thread-Index: AQHZjJbjD8klW60afUC7CKFCJzEnv69sK/0AgAblY/A=
Date:   Tue, 30 May 2023 16:48:57 +0000
Message-ID: <OS0PR01MB5922A51D1D4AF195C24BE6FC864B9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230522101849.297499-1-biju.das.jz@bp.renesas.com>
 <20230522101849.297499-8-biju.das.jz@bp.renesas.com>
 <CAMuHMdW_9JNusQ3USMHam5D9fu93CgBD46w-oMb6MQ-V=33Xnw@mail.gmail.com>
In-Reply-To: <CAMuHMdW_9JNusQ3USMHam5D9fu93CgBD46w-oMb6MQ-V=33Xnw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYWPR01MB10427:EE_
x-ms-office365-filtering-correlation-id: c8e9fc27-b4ae-4bac-c720-08db612dc2c8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /VY5L1VAgeX7t0cX3DfKwqTjj4v6tzU9U/VrmZzPQNvVI4CiflY9Fg7y+KePogrYNRaugGWTK7W2LwaDvJQuj1GHqrtuxX0GL7zNaiPaBPDMxuYR67b7VWcXW7jUJYAjNFA7f82aqzCuTV84UUuivDNPHJnmDGZXBRTZlo9bN7+A0ChUMsLOcec1IFBKzlRByL7vbJ8e4qeT0HBBgs5X7+0JZqQPK4hzFGBjCpGdjRTQWG1FAmgUztpS4X31xmAZmTJaZ8HygrPMZ+rPJehWr9+Vfc/5aNwJWh5zW3X5urFAlqbtxYD75kjzcPZKmaroMtFgssMWjfytZ4/PkdJQC0oWdQESYev8uwoWG3w3z7Q6F1fKstmGelhj0HV6XHqN7SxQLw5uod81qs38cY+z48nbqrW8cfPcEUiWuoe2KoKyFmnOcuV4iMzDm8XZa9d+90NSH0HK4F+wbLuS9RGaTzuvq+SmzdfLywfabyIw7B9AWAmuBsMQ4s/bW+jvFQfD0eCVKwFg87x5txAd+Naap5YjDLcke49u+otYJijJMaPfuaKa7wFs6wq23Ub8GPRQBHoVsmqwW6xa3yDtQUkL8rzpy7e1NhGhT9LudBf3Qk/hNXiriqtqFrEDoCsbz/a4
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(396003)(346002)(136003)(39860400002)(451199021)(53546011)(41300700001)(8936002)(8676002)(38100700002)(122000001)(6506007)(9686003)(186003)(52536014)(26005)(5660300002)(83380400001)(55016003)(54906003)(66946007)(66556008)(66446008)(76116006)(66476007)(64756008)(316002)(6916009)(4326008)(2906002)(33656002)(86362001)(7696005)(71200400001)(478600001)(38070700005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NW9pV2NYZURsZEJqYTNJc0JMbGNLcDcxaUU5dml2WjlEVmI5VGQ1RDhFd1dW?=
 =?utf-8?B?NStYUWgxT2VnSEFxVXJBcm1iTTh1bDkxeGxSbi9jUmo3SHhQRGJ1NEEyM2NS?=
 =?utf-8?B?Y3IxQWgzZVZtZVFKWGVOWUtMbWc4OGlBT2ExU2VNRzlGdUVNSDJ6eHk0Njhu?=
 =?utf-8?B?WkQ3QlEwYUp2eG5qSXVnRExLdlBubndmbncrbDRNTDJUYzBrTlo3dXpNcGJV?=
 =?utf-8?B?SGtKUUJ3Q1R0L25lR2tUY3BJTnUweHV3MVFWaUdReWhvME5WWDVUQXNLUk1k?=
 =?utf-8?B?ZEYyekhFQWJBY2NZams0aW8yeG5BOWdINEhQZ3BVUUo5OHR0NjM3b2xUWU90?=
 =?utf-8?B?dlhUdFJhZVBCZVo1NjJONjdJREp3RXdRUVo5cXlwa3piVmYwVnNZYUdJbjNm?=
 =?utf-8?B?T1JXNGVSZXFxdTJDTnd6VUhDTmpkZmxDRVhBUmFKc0Q1QUVEYytMVzJBT05u?=
 =?utf-8?B?N0k0Y0lUUEp2dEtzYnpxL3NYK2xkc1EvUkhYZTExQ3pmbWtxWXVhMVVWQmpa?=
 =?utf-8?B?SDdJYVpTVm13dEVFWGlQRG1rTCtFQTNWdHJWRVE4bmJFNi9MZ3pWVWp5dEZE?=
 =?utf-8?B?WWxUVVQ1bEJENk02Rkhndlc4YjNyMTRWYnFtWnFwdERaRGZpRHV4bUIwbXVs?=
 =?utf-8?B?dFRFNFhBM2wyRWkrbmVsQTJoM2dsc2t4dzFvcllBQ3h1U1dQb1g0aEdNdXg3?=
 =?utf-8?B?bXlUMkMybDd1TmEvT1JsYTJtYnVvWlNkT0hseEN6SHIzNDBEcDYvcXYrMmx2?=
 =?utf-8?B?UFl1dVB4eStnU0p3ODFEZFRWQ1F6cC96cThnbi82cjVLcHlaZmFRK2JoazMw?=
 =?utf-8?B?b3VkeGRiZG1FUnNNdW0yNlM2c08vczlUa2t4WmtDb0dmZE0zWUZkN0NJWURR?=
 =?utf-8?B?Mms3dUNPd3F3VzF3K1hLb2oydk55TWJVeitpR0xpNCt3S3NtVDBsTEdiSE9v?=
 =?utf-8?B?Y0FHNWt2cFRianVMSkZtUndiODlsWnlDVU0zaHdSMWIyNTdtdzJvblkvamV5?=
 =?utf-8?B?aFk0clRiSFdHSlhhYUM0YzRSYkg1elp0UllscW1IRnIvcGprb0NzclMvK0RG?=
 =?utf-8?B?dm96NVRWUS9tdk1ldXFQUzk2ZDRONmt3N21pcGRBZVgrelYvek9IRHorZE5k?=
 =?utf-8?B?OUM2MTZ2d1A2OTJNTHFmUndDRXA0T2xSQ1FyRmJaTWlpejV1eHdYRlVrWmZJ?=
 =?utf-8?B?S0IwSGhZVG5PaXRFSU0vSW1hK1NuSGhSK2ZxQ2VBK0JtY3YydUdQMmVyU2Ix?=
 =?utf-8?B?WDJjTFIxNEdkRHkzUVRwU0h1WXZJNHVnN3daU3EwRjArekM0VWo0d0ozRFVP?=
 =?utf-8?B?c2tVTlhXTlNjWHpleTUrTVE3anlrbzFwaFF6YkFhVnVmM2pZNnpuc05lUHJn?=
 =?utf-8?B?dGV2ZytOaWtIZjJ4b0Q5YnhrWVZ5R2FhamV2RHIwVFQ4bCtXWUVXMVVsck04?=
 =?utf-8?B?U2MxYUV0QkpBcldiSFhmNG5uUXNBMVVJa0VJaS9tVHdnM0xnRU4wc2lBdlk5?=
 =?utf-8?B?TG5CRDUvMWZlTGI0a1NabnMybittMjNPbW5oaWM0ZExBMmROdk9uS2dPVVpW?=
 =?utf-8?B?N1BOVTB4K1poSlpWNXViVFlaWmtFNERhc1VpcWdFYzhVd0xocWFBelY5b0Vx?=
 =?utf-8?B?SHBVUHMwb2pUS3d3eldtcEN4dnJyQVo0Qmp5Q0lkd3ZFcjVta3BiVFZSZlhO?=
 =?utf-8?B?aFBuN0h4K2tob3QwdmlQSzVoOWVRTUZMNzNSa28wVGlkN0tBOE5jaCtJTnJt?=
 =?utf-8?B?SXpBRFgwRU1vQnR0QXNkUFRnL1BhekVLQVhZaGdOMG1aeTdka0N4NE5KcHE0?=
 =?utf-8?B?NUpGaE5GeDlackNYcXBKNmVyZTNJTDM3bnNqWVhob08xZnNQYjJ4ckRURWlK?=
 =?utf-8?B?NGV6V3NCWjViRjN2d1JMOW90MEl5K2JGR29CSGZDK29WZUdrMFUxdVg1aXE5?=
 =?utf-8?B?aTdOMVlLenloSGRvMmRzcktvbGlWUm9kT2ZZQlJaMmxLSktmTUprVmlTb0hq?=
 =?utf-8?B?cHl1RTluVFhuTEN4WmhnaGV1b01lbVFQUTVwNVg0dGhiQUdmMVErUkJCTGp4?=
 =?utf-8?B?VjAya2ZuZS8ramljV2gvRWpINDBzZFJDTXVGSjlpOUJxSHRNTnlEa28zd0xY?=
 =?utf-8?B?YU84a1dYTE92QVVHVS9uZC95ZnJKRWQyZTJDd0NjVWxCYTB5SnE1bGZudity?=
 =?utf-8?B?aEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8e9fc27-b4ae-4bac-c720-08db612dc2c8
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 May 2023 16:48:57.2246
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yxuGjPUr9JSirolJs2meiyY1FY0Ax+8oksNJkoDoZnZvyyXSW23o3/fUUZssSu0Zg0jz9e6arTJA52HaJJlpuo+55MXf1Ha+l7yyM/dMAa8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10427
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IEZyaWRheSwgTWF5IDI2LCAyMDIzIDg6MjEgQU0NCj4gVG86IEJpanUg
RGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gQ2M6IEFsZXNzYW5kcm8gWnVtbW8g
PGEuenVtbW9AdG93ZXJ0ZWNoLml0PjsgQWxleGFuZHJlIEJlbGxvbmkNCj4gPGFsZXhhbmRyZS5i
ZWxsb25pQGJvb3RsaW4uY29tPjsgbGludXgtcnRjQHZnZXIua2VybmVsLm9yZzsgRmFicml6aW8N
Cj4gQ2FzdHJvIDxmYWJyaXppby5jYXN0cm8uanpAcmVuZXNhcy5jb20+OyBsaW51eC1yZW5lc2Fz
LQ0KPiBzb2NAdmdlci5rZXJuZWwub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjUgMDcvMTFd
IHJ0YzogaXNsMTIwODogQWRkIGlzbDEyMDhfc2V0X3h0b3NjYigpDQo+IA0KPiBIaSBCaWp1LA0K
PiANCj4gT24gTW9uLCBNYXkgMjIsIDIwMjMgYXQgMTI6MTnigK9QTSBCaWp1IERhcyA8YmlqdS5k
YXMuanpAYnAucmVuZXNhcy5jb20+DQo+IHdyb3RlOg0KPiA+IEFzIHBlciB0aGUgSFcgbWFudWFs
LCBzZXQgdGhlIFhUT1NDQiBiaXQgYXMgZm9sbG93czoNCj4gPg0KPiA+IElmIHVzaW5nIGFuIGV4
dGVybmFsIGNsb2NrIHNpZ25hbCwgc2V0IHRoZSBYVE9TQ0IgYml0IGFzIDEgdG8gZGlzYWJsZQ0K
PiA+IHRoZSBjcnlzdGFsIG9zY2lsbGF0b3IuDQo+ID4NCj4gPiBJZiB1c2luZyBhbiBleHRlcm5h
bCBjcnlzdGFsLCB0aGUgWFRPU0NCIGJpdCBuZWVkcyB0byBiZSBzZXQgYXQgMCB0bw0KPiA+IGVu
YWJsZSB0aGUgY3J5c3RhbCBvc2NpbGxhdG9yLg0KPiA+DQo+ID4gQWRkIGlzbDEyMDhfc2V0X3h0
b3NjYigpIHRvIHNldCBYVE9TQ0IgYml0IGJhc2VkIG9uIHRoZSBjbG9jay1uYW1lcw0KPiA+IHBy
b3BlcnR5LiBGYWxsYmFjayBpcyBlbmFibGluZyB0aGUgaW50ZXJuYWwgY3J5c3RhbCBvc2NpbGxh
dG9yLg0KPiA+DQo+ID4gV2hpbGUgYXQgaXQsIGludHJvZHVjZSBhIHZhcmlhYmxlICJzciIgZm9y
IHJlYWRpbmcgdGhlIHN0YXR1cyByZWdpc3Rlcg0KPiA+IGluIHByb2JlKCkgYXMgaXQgaXMgcmV1
c2VkIGZvciB3cml0aW5nLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUu
ZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+IC0tLQ0KPiA+IHY0LT52NToNCj4gPiAgKiBGaXhl
ZCB0aGUgdHlwbyBpbiBjb21taXQgZGVzY3JpcHRpb24uDQo+ID4gICogUmVwbGFjZWQgdGhlIHZh
cmlhYmxlIGludF9vc2NfZW4tPnh0b3NiX3ZhbCBmb3INCj4gaXNsMTIwOF9zZXRfeHRvc2NiKCkg
YW5kDQo+ID4gICAgY2hhbmdlZCB0aGUgZGF0YSB0eXBlIGZyb20gYm9vbC0+dTguDQo+IA0KPiBZ
b3UgbWlnaHQgYXMgd2VsbCBqdXN0IHVzZSBpbnQuDQoNCk9LLCBXaWxsIGNoYW5nZSBpdCB0byBp
bnQuDQoNCkNoZWVycywNCkJpanUNCg0KPiANCj4gPiAgKiBSZXBsYWNlZCBkZXZtX2Nsa19nZXQt
PmRldm1fY2xrX2dldF9vcHRpb25hbCgpIGluIHByb2JlLg0KPiA+ICAqIElTX0VSUigpIHJlbGF0
ZWQgZXJyb3IgaXMgcHJvcGFnYXRlZCBhbmQgY2hlY2sgZm9yIE5VTEwgdG8gZmluZCBvdXQNCj4g
PiAgICBpZiBhIGNsb2NrIGlzIHByZXNlbnQuDQo+IA0KPiBSZXZpZXdlZC1ieTogR2VlcnQgVXl0
dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT4NCj4gDQo+IEdye29ldGplLGVldGlu
Z31zLA0KPiANCj4gICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQNCj4gDQo+IC0tDQo+IEdl
ZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0g
Z2VlcnRAbGludXgtDQo+IG02OGsub3JnDQo+IA0KPiBJbiBwZXJzb25hbCBjb252ZXJzYXRpb25z
IHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4NCj4gQnV0IHdo
ZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Ig
c29tZXRoaW5nDQo+IGxpa2UgdGhhdC4NCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAtLSBMaW51cyBUb3J2YWxkcw0K
