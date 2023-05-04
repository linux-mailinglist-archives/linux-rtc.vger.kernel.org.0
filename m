Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 882106F6FAF
	for <lists+linux-rtc@lfdr.de>; Thu,  4 May 2023 18:16:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229553AbjEDQQM (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 4 May 2023 12:16:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbjEDQQL (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 4 May 2023 12:16:11 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2090.outbound.protection.outlook.com [40.107.113.90])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2C35118;
        Thu,  4 May 2023 09:16:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B1ASx6DqKU1STuaNGSuhOJKl/8UxLz2c57peWBbsZjlz+i3JSlv3g21ur3kPE6JBShtpa5zTI02VCVgv3VjJXym/kGi0NqR53ydplr8hgHaFY7csAM0aBplf94Ls9+yhXg9sX7+uc7hHGMje7GVF9q4bFlsNfAYxPirDli+L2gAKrMlBKJWRvvQtclgIKaREl5vCFYIgOao+kjMCQySk8lTuNz1HZ37AgDMsL0rtyY4SzpMwVURNbw5MQ81XufqiYUt6Uf2Oium3qJd1sge3oLE7oM6/p6kxHHOFHKiQXJYw8qkV/vyrLk318xkimbAPGQOYSzGlXTxas9CVQEou6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FdFNo1bIQHHilo014Hf7yIH7XfibarqKqXA2aUHBQaw=;
 b=dKgbWZcKFdhAumucMaukr88Rs6z5jKhM1SqmvQpG3/Mj9KKMqPU0S+fSuHbz3BDTFvgS2ydk0KtWeOcOUOEu6hvgmifZ82k7lyKf1STYlPr9D+Iq+fRo3SCURVA9kIdfLYZY7fmGtleJqu31DUMnqdSAqkeB0/XjURGyQLodYQ3XLEcBuvi51iqhfrAHDlH0qdLW16/t1hyo4p12hkqJpOyNSROXbT2YEdm42gIMuKK1FSv20zpGew0fLqe3vevkCskQJ9Y+r3CZrtH/IJp7RZn+1niAnSXmTH+ewpMYRxYEYjA5DtOdqVfpfTSaVI8VUN+xDwS9S6K0evgtAXRAGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FdFNo1bIQHHilo014Hf7yIH7XfibarqKqXA2aUHBQaw=;
 b=RIsZGU6PvsOkBT1NBe/VnZgjI4RF3LdOvC6HGGDDoaQGhkrPeXo2UhX0ztTS1oUgoICONs6F4l72tBGJ64kgnB2aOQ4feksV+Y1/4VQuzFNb3BK/HyL8gFpHNITOSngQIPmWy6iBznbqBxs2tYqpgYFeOur56+XQ6BQMTUJmRKM=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSZPR01MB8292.jpnprd01.prod.outlook.com (2603:1096:604:181::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.26; Thu, 4 May
 2023 16:16:06 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2%6]) with mapi id 15.20.6363.026; Thu, 4 May 2023
 16:16:06 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Trent Piepho <tpiepho@impinj.com>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: RE: [PATCH RFC 4/6] dt-bindings: rtc: isl1208: Document built-in RTC
 device on PMIC RAA215300
Thread-Topic: [PATCH RFC 4/6] dt-bindings: rtc: isl1208: Document built-in RTC
 device on PMIC RAA215300
Thread-Index: AQHZfZvC9fb/fP1WtkWOaUSQWSRFO69Js+4AgACXm2A=
Date:   Thu, 4 May 2023 16:16:06 +0000
Message-ID: <OS0PR01MB5922A910C2D5F09A78537621866D9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230503084608.14008-1-biju.das.jz@bp.renesas.com>
 <20230503084608.14008-5-biju.das.jz@bp.renesas.com>
 <db7ae5f9-393a-b892-dd6f-08c4f25ce7a8@linaro.org>
In-Reply-To: <db7ae5f9-393a-b892-dd6f-08c4f25ce7a8@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OSZPR01MB8292:EE_
x-ms-office365-filtering-correlation-id: 3d947aa1-414a-43c6-55f6-08db4cbadd3c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VzLcE8rSiVs874mfxSgv9WeiQDSxBmiwFcUGK6x8CUXA/FMT8W1D0m+cynKU7nhDeagkMQ3Tkf/q0tLCHrhsTBmzLXqiB7b40pAfTwBmKCRpMvIHBVj42+LH9gm+ZvFd3ohUpJe+ZAFYQ9v95s1+Wc3rY0tKcJQZvrGMufCuzpOkkg6HKi9sHNhhxCBviTk3RV5wcnmVjCTFwaF1IwV57VE9Y5YOZxjaQwoY91OhXTMcqVYR1wJgOy3jT9pXK01//vceLcxVHDYE3u+ZCwJpBlXUg0WpSH08Up/6z+hSmIqieAAXNF6/wovt6fMHQw1FJZwtoWVrTi64L1Okl+KgGYu3UWSvBvgQ1Bu3nQLQ1uwPSwyZ2pD2L+XImoCjkp4u/oaI78j9gOR8V3/DU4JMawazM9dEcNW3Sf+p5dLtUomEiNOC2smm6clguw+bUgBVMfRFTVd5/IjVYozRY2pT46d0dwGHgDIjLAqvzW6YXa5pmj4ojdhkPfHh/bCdFJMkuH/uO6d+x0zeoEnsuqcdt+ervHeGpzqAY6AnMDnobRQhHNAaABZj/SEi0/YlpW87s05+QPiJSBUGsikYZfMW2fEqyObi67TquYqrbTUrpiqfvMsha2aBuW7hlsOqtiL/
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(346002)(136003)(396003)(366004)(451199021)(38070700005)(8676002)(107886003)(8936002)(5660300002)(2906002)(83380400001)(7416002)(6506007)(26005)(9686003)(53546011)(33656002)(122000001)(478600001)(41300700001)(86362001)(66556008)(4326008)(64756008)(66446008)(66476007)(52536014)(55016003)(71200400001)(7696005)(186003)(38100700002)(316002)(66946007)(76116006)(110136005)(54906003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NUdkZURVVzFvK3FNTVV1WGxlbXMydWxaRlRnVnAwWWt4TThDOEhmVzlrOSt4?=
 =?utf-8?B?cVVscU94OE1UZnFMZytpdWE2amkvUC9WNlI3bTV0NTlHTW5IazRrUkVNUytV?=
 =?utf-8?B?SUUvdWU4YTZxN2lsbmZYNW8zQjRKNlNRbXIweUNmV01RVkNxaGVpdXd0NEp3?=
 =?utf-8?B?aEJpcitwODh0bnBKTStLRWhXNDRLdFRzWDVsdW0yQ1oxTEk5R1VRSExZVGR4?=
 =?utf-8?B?RVViSTdKNndYNG01VkFiZ2RObENrRERPMXNpSDVBNTdwalRuaE1LZGxDWHVx?=
 =?utf-8?B?dko4OG0waTdPWG1Ka2ZHRzZNNWY5ZUhnOGxBTUcrYW9nUHM0YThya2xDbGJn?=
 =?utf-8?B?ZDExZHVxZHVXamFFUlNEaDMzQU54d20za1Zkd0dVVzVaVFUzaWprOE1mMHQ0?=
 =?utf-8?B?NE85Q1BDak1ZeGluc3g4S2wvZFlwVVI0Mzc2QUZ5UGJQZUI2QmZHNDlseWtw?=
 =?utf-8?B?V2N6VWNmbkRnWmdPRmg3TGhvRFlmazN4OEc1T2p6bUVScmhwYkVmRDFlVTB4?=
 =?utf-8?B?YUJXbG1FS2VBUXlmdVdsVzdyZTI1NjJESUR6aW1CTHA4N1Z3KzUzSVd6aDBj?=
 =?utf-8?B?eCtacmRlMXE1QW9nUVpkVWM1dDhpOG1vY2thYVhBVjc0T2tyV3NBOHlCNk44?=
 =?utf-8?B?SlVFKzZvSUtRbTM3Q3BZYXhMVi9HcElTL1Y5WjlweklGNlpBNHVRNmdTVWFG?=
 =?utf-8?B?aEFHMjQ0bFZpYi95QnYrQktwZWhNNzd4aTRFNzkxSFljcXAzQjhNY2JOWnBp?=
 =?utf-8?B?T0grbnVDdFlXSDVoMERkd1FVRExaZjI1NXNtVjhycExncUNJUEhGL1dQbjY5?=
 =?utf-8?B?cTJqT2xlVGlGMHVEUUEwclpzajc3ZU1iUi84eWJYWmlWL2Q3VklvbXRod1h5?=
 =?utf-8?B?TjZwUFhCYmpQQ21VOHRTbHVpdFJlYzdld2wxVW1xUlU0Yjk3Q2pXUm9oWWhs?=
 =?utf-8?B?TGd3UDErc2tyUGV0RlVrd3l3Qmo0T29nREhTdEYvOHZnYnk0eWRoeVNoYUp2?=
 =?utf-8?B?WnBGbkY1TWhZWm1aUzVMb0c2OFBFUklydXlBVjNjUU5lQjE1R2VXMzdia1VT?=
 =?utf-8?B?dXBhMG01NFQ3R05EeGptcnRSeW41c3UrTGFlWTJkNGJwRXB5NHNkVjRraE9O?=
 =?utf-8?B?VG1XZnozVVFxQmNaczZLN3B3aVJGWk9WQjdvZFJCWlRscmc1NjRoZnp1T1Bk?=
 =?utf-8?B?VjBDM0JyNHhlZFlHZnl6N3RQc3lRMW15WFFKVWNSUDB3anhic3NFV2NITGlt?=
 =?utf-8?B?M2F2NTF5RUcxdzZMV3NNOExQVkl0bWNxM2thd2xxMCs5aHlLZmNxZlcvc3Fu?=
 =?utf-8?B?VmVsL1VYbzk2TThQK3UxQTEzS1pHV1BnS283akdhb0FZejNhQytBZmNTZElG?=
 =?utf-8?B?TDhaVXhVL1JhYWpBRy9ZdTlQRFRuVUQ3UTZDL1l6ZjlMNXJ3QXdxeU5HSHpY?=
 =?utf-8?B?R0s5MThVWkhUM1UzVmg0Q3hlVzNlZnFPcDJMakFHVzh3VGhuRTdsaGJGYmtt?=
 =?utf-8?B?ZjMwYUhpV2dRUUtvSzBSQS9HWHB1dXUxNWw5dmFjbFhFUU51dkdHZzJoTnZL?=
 =?utf-8?B?VU4yNFJVTFBmN284VUltZ0RabEpuSjhvUzRoa2x4NGkzM3crdldqSVRFSElC?=
 =?utf-8?B?MG5JcmU1eWhYYzZTS0MrK1ArRVhsSDAwNjRZbzhwV2FGajhlNGIvTnJONEJx?=
 =?utf-8?B?VDJidDlTVW5La3ZXN3JWNFBWeVVKZXoya1lvTlVvbXp2WnZ0SzJoODJTS3lB?=
 =?utf-8?B?ei9jc3BzR0xla3VNK2E3dlJZOTF3UEVBQk9kWkk2OFAzRDE2YjVsaTdMakVu?=
 =?utf-8?B?QVduUEVXRG5BTEZkRXBaWEpIeTlZV2NtS0x0cXBTdW5xY3Fya1cwM24wNW9a?=
 =?utf-8?B?bVdFMEVobDNzajdPOENVRjlucUNickw0cHRXMjJXMDl3YStjbHhVY1QyV1VM?=
 =?utf-8?B?amE2NVlMeGUwQURCempzK3dSS0VUVVVmRVZmc08rdzRBNTNJWkRWTkY4aVlB?=
 =?utf-8?B?Vk14TnRYM3BFbTJnM3JIK0JDNTFaOVgxRnFRSURISHdDWHVjb0tuWi9QMWs3?=
 =?utf-8?B?RWtIWVR2dnVMN2NvTWJoNjhFUy9kdXRKNSs0cG1MSnJSdHVXai9iVG1uUlQr?=
 =?utf-8?Q?9kTjnkrTTul/rE+Wr1cG57fji?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d947aa1-414a-43c6-55f6-08db4cbadd3c
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 May 2023 16:16:06.2158
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OYf+1MTUWA8QrkH2eF7KK8BXBgLI775UaFeCGtQTuRPbW+iWdyjO+WnrwiYozPhbDrjz5p7QNat/I6QN/3zm7Pcw1aI6+4gbdn9YWSbKYKU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8292
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

SGkgS3J6eXN6dG9mIEtvemxvd3NraSwNCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suCQ0KDQo+
IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEtyenlzenRvZiBLb3psb3dza2kg
PGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4NCj4gU2VudDogVGh1cnNkYXksIE1heSA0
LCAyMDIzIDg6MTEgQU0NCj4gVG86IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNv
bT47IEFsZXNzYW5kcm8gWnVtbW8NCj4gPGEuenVtbW9AdG93ZXJ0ZWNoLml0PjsgQWxleGFuZHJl
IEJlbGxvbmkgPGFsZXhhbmRyZS5iZWxsb25pQGJvb3RsaW4uY29tPjsNCj4gUm9iIEhlcnJpbmcg
PHJvYmgrZHRAa2VybmVsLm9yZz47IEtyenlzenRvZiBLb3psb3dza2kNCj4gPGtyenlzenRvZi5r
b3psb3dza2krZHRAbGluYXJvLm9yZz4NCj4gQ2M6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQr
cmVuZXNhc0BnbGlkZXIuYmU+OyBNYWdudXMgRGFtbQ0KPiA8bWFnbnVzLmRhbW1AZ21haWwuY29t
PjsgVHJlbnQgUGllcGhvIDx0cGllcGhvQGltcGluai5jb20+OyBsaW51eC0NCj4gcnRjQHZnZXIu
a2VybmVsLm9yZzsgZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LXJlbmVzYXMtDQo+
IHNvY0B2Z2VyLmtlcm5lbC5vcmc7IEZhYnJpemlvIENhc3RybyA8ZmFicml6aW8uY2FzdHJvLmp6
QHJlbmVzYXMuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIFJGQyA0LzZdIGR0LWJpbmRpbmdz
OiBydGM6IGlzbDEyMDg6IERvY3VtZW50IGJ1aWx0LWluDQo+IFJUQyBkZXZpY2Ugb24gUE1JQyBS
QUEyMTUzMDANCj4gDQo+IE9uIDAzLzA1LzIwMjMgMTA6NDYsIEJpanUgRGFzIHdyb3RlOg0KPiA+
IFRoZSBCdWlsdC1pbiBSVEMgZGV2aWNlIGZvdW5kIG9uIFBNSUMgUkFBMjE1MzAwIGlzIHNpbWls
YXIgdG8gdGhlDQo+ID4gaXNsMTIwOCBJUC4gSG93ZXZlciwgUlRDIGlzIGVuYWJsZWQgYnkgUE1J
QyBSQUEyMTUzMDAgYW5kIHRoZSBwb2xhcml0eQ0KPiA+IG9mIHRoZSBleHRlcm5hbCBvc2NpbGxh
dG9yIGlzIGRldGVybWluZWQgYnkgdGhlIFBNSUMgcmV2aXNpb24uDQo+ID4NCj4gPiBEb2N1bWVu
dCByZW5lc2FzLHJhYTIxNTMwMC1pc2wxMjA4IGNvbXBhdGlibGUgYW5kDQo+ID4gcmVuZXNhcyxy
YWEyMTUzMDAtcG1pYyBwcm9wZXJ0eSB0byBoYW5kbGUgdGhlc2UgZGlmZmVyZW5jZXMuDQo+ID4N
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+
DQo+ID4gLS0tDQo+ID4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3J0Yy9pc2lsLGlzbDEyMDgu
eWFtbCAgICAgICB8IDEzICsrKysrKysrKysrKysNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEzIGlu
c2VydGlvbnMoKykNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvcnRjL2lzaWwsaXNsMTIwOC55YW1sDQo+ID4gYi9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvcnRjL2lzaWwsaXNsMTIwOC55YW1sDQo+ID4gaW5kZXggMDRkNTE4
ODc4NTVmLi44ODhhODMyZWQxZGIgMTAwNjQ0DQo+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL3J0Yy9pc2lsLGlzbDEyMDgueWFtbA0KPiA+ICsrKyBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ydGMvaXNpbCxpc2wxMjA4LnlhbWwNCj4gPiBAQCAt
MTgsNiArMTgsNyBAQCBwcm9wZXJ0aWVzOg0KPiA+ICAgICAgICAgICAgLSBpc2lsLGlzbDEyMDkN
Cj4gPiAgICAgICAgICAgIC0gaXNpbCxpc2wxMjE4DQo+ID4gICAgICAgICAgICAtIGlzaWwsaXNs
MTIxOQ0KPiA+ICsgICAgICAgICAgLSByZW5lc2FzLHJhYTIxNTMwMC1pc2wxMjA4DQoNCkFzIHdp
dGggdGhlIGJlbG93IG1vZGVsLCBhYm92ZSBjb21wYXRpYmxlIGlzIG5vdCByZXF1aXJlZC4NCg0K
CXJhYTIxNTMwMDogcG1pY0AxMiB7DQoJCWNvbXBhdGlibGUgPSAicmVuZXNhcyxyYWEyMTUzMDAi
Ow0KCQlyZWcgPSA8MHgxMiAweDZmPjsNCgkJcmVnLW5hbWVzID0gIm1haW4iLCAicnRjIjsNCgl9
Ow0KDQo+ID4NCj4gPiAgICByZWc6DQo+ID4gICAgICBtYXhJdGVtczogMQ0KPiA+IEBAIC00MCw2
ICs0MSwxMCBAQCBwcm9wZXJ0aWVzOg0KPiA+ICAgICAgICAgIDwwPiA6IEVuYWJsZSBpbnRlcm5h
bCBwdWxsLXVwDQo+ID4gICAgICAgICAgPDE+IDogRGlzYWJsZSBpbnRlcm5hbCBwdWxsLXVwDQo+
ID4NCj4gPiArICByZW5lc2FzLHJhYTIxNTMwMC1wbWljOg0KPiA+ICsgICAgJHJlZjogL3NjaGVt
YXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvcGhhbmRsZQ0KPiA+ICsgICAgZGVzY3JpcHRpb246
IHBoYW5kbGUgdG8gdGhlIHBtaWMgZGV2aWNlIHdpdGggaXNsMTIwOCBidWlsdC1pbiBSVEMuDQo+
IA0KPiBOby4gWW91IGRvbid0IG5lZWQgY3Jvc3MtbGlua2luZy4gV2UgZG8gbm90IHJlcHJlc2Vu
dCBvbmUgZGV2aWNlIGFzIHR3byBhbmQNCj4gdGhlbiBmaXggdGhpcyBieSBjcm9zcy1saW5raW5n
IHRoZW0uIFRoZSBleGlzdGluZyBiaW5kaW5nIGRvZXMgbm90IGhhdmUgaXQsDQo+IHNvIGl0IHNo
b3VsZCBiZSBhIGhpbnQgZm9yIHlvdS4NCg0KT0sgd2lsbCByZW1vdmUgYXMgZGlzY3Vzc2VkIGFi
b3ZlLg0KDQpDaGVlcnMsDQpCaWp1DQo=
