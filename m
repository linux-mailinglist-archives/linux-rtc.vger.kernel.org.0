Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6EEEB6FDCDC
	for <lists+linux-rtc@lfdr.de>; Wed, 10 May 2023 13:37:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236410AbjEJLhs (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 10 May 2023 07:37:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236697AbjEJLho (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 10 May 2023 07:37:44 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2133.outbound.protection.outlook.com [40.107.113.133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 482762703;
        Wed, 10 May 2023 04:37:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kZXJbVBOes/R22FdvoeSw6rP+ie5/RCo1/VMxVEl1PN1/ScPr/NxnjhFGsVoAsbtyIFRK2ikELRqrE4qbfcfMrg21RhHL1R/9LqGNgl/sRzgzobNwNf9areGjbdgJMgM38frU1++XOnFYbAY/fChIB1wniyPvYwSaaG7wwB23G8wxEbRlwSv5GL5YWm9QLUyo6JeAmasmB++Fz2z+7MXtMgPcBC4lrvBrPGtPWIyQOFQ9RoW4rQymSdEJBYdp797RHKOSKtJPjX6w4jfM1W7U6LA+ZtUh3ZdTG8cQUBqCebA9MU87NjN42u+1+VkUjynFqmE0rJ1OuSY5P5c7ELReQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=id1WcgO4y8w8LUsuy+7o1YcheAn3z2j0WvhTyrOJqxM=;
 b=RvjLcn8BpkbPaUtpqFD6y7tVOuFPj13iwmasKdXfM9ShZjuHxvQoSOoj81FpsXZLQGbxnlDci7UtMSOi1Mq3zDDDLNPzWhgI07dNQJqKS4p2xvknN8dyrHjNd1mauvPU8ziiwF4UXtDH+bfECAfhhBea4kQQp/dvnb+/B3mygI7g9qEiwcXVZZlRW7eNKicpadddOyObJ/yUGxxdl5jvFNr/0poUPNfjAX3tSdZVARfffG3ScO3HdSSRZYuGbZNwqYSTH1bhsBma082u+uceMW1d2eE8E9KCip06fgDg9+U/usbESHvtHrbLLVR90boNqaFmxfVMaX/hLiNp1Pg3sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=id1WcgO4y8w8LUsuy+7o1YcheAn3z2j0WvhTyrOJqxM=;
 b=BG5G53pi6Xq4B5MangD7Sakcwz023y15hD6O0tyw/d8FyDRHYlgdrjeBalveF+WsdUaTZi56MUMMQ2HWu9+7Puk3CnrWNKCedSKz/E0mDHEg2f47MQZx90wv65GWz8Ro26sKvzvPcsw3yRLihM87orDSqsU37idu6TYNPb1n3JM=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TY3PR01MB11039.jpnprd01.prod.outlook.com (2603:1096:400:3b4::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.18; Wed, 10 May
 2023 11:37:34 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2%6]) with mapi id 15.20.6387.019; Wed, 10 May 2023
 11:37:32 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Trent Piepho <tpiepho@gmail.com>
CC:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v4] dt-bindings: rtc: isl1208: Convert to json-schema
Thread-Topic: [PATCH v4] dt-bindings: rtc: isl1208: Convert to json-schema
Thread-Index: AQHZgnf5UhDOi7L5ME+iJHLI6dBSHK9STQEAgADGGgCAAAF7AIAATM0g
Date:   Wed, 10 May 2023 11:37:32 +0000
Message-ID: <OS0PR01MB59223DA1A4360CC0E97AC2A486779@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230509131249.80456-1-biju.das.jz@bp.renesas.com>
 <CA+7tXig2nwCk3DKwFEKGKVko=YD4e4KCpRVUMMM2pgPRpNgiiQ@mail.gmail.com>
 <CAMuHMdUOdJrPdcx684zKaSNFMqkRWL_y3jdAor_D0AeDRpRhJQ@mail.gmail.com>
 <0620e3ef-ece5-550a-43bb-0d6e75de79bf@linaro.org>
In-Reply-To: <0620e3ef-ece5-550a-43bb-0d6e75de79bf@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TY3PR01MB11039:EE_
x-ms-office365-filtering-correlation-id: f2efcc24-6573-4daf-06cb-08db514af16c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qY9nQDVXUWImTYBdD3L24dsUrqlIYQ6burcWczszs0hCsZkCpdgynkJv1uqlHKIs1CgBFzrM031bPhU95GJcaJHmM+LyBHJ67C3j3f9qT0fxV86uEZKnumzMoB7x7tY+ilQ4coeMGiYyzR78SzIYaEyQCImumexvqdMyWSbWys8EIeuPShvIFBgGXavT6xLv/bMluiWYBabBmrJYNqwUdmclOw/Y0jYYHMx84QttW8ow6UfiXCAi0Irl7WW14BbUz3U0YoK3kE2lD1/coLoJ2b7TMNMOra4Ph7HM5j4tWBJHr47cPMoBisAB+pW5U2jRRLwCXpGHKI3G0a52gDOvxNwJLbBZupAyz3jCIENFGUdlV89n++Yu+XiNDs/KdAbqWiKgHmZsBTH4rZVVhxFNj0afjaWeFibiQBkQJRvAAIncNhNGmKwhmCNnxG2vgdUof4g++r4lvdXy9MKcxsAwvOwaxcz/JXJFkzXRT1iwdJRXLfKOTS8VnXW6ah2CaUDNuMJd+Aagez+60ZxBfuUCvihvN1Z2VEPN67yNecUIVeoiNVP3Oy8BTiS692fDGflejpzouO7oLkUB2hmkloo6uX8EzyXVaFc7uSj+9+Y6Fnn8Lwm6BSSne0Z7QwKGH0ca
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(346002)(136003)(396003)(39860400002)(376002)(451199021)(7696005)(83380400001)(7416002)(52536014)(5660300002)(122000001)(41300700001)(2906002)(38100700002)(8676002)(8936002)(86362001)(64756008)(53546011)(26005)(55016003)(9686003)(6506007)(38070700005)(4326008)(316002)(71200400001)(186003)(33656002)(478600001)(110136005)(66556008)(76116006)(66446008)(66476007)(66946007)(54906003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S1JUOHJFcmFvV3lSODFHMEJSRFlGK0ZVRGErSmpxS0VubmVsclR0VkFaUWZv?=
 =?utf-8?B?am9tWTlsVE1nRGVGRHpMQ24xVlFyTTBHcThoYzh1UFVSWWxiTGhhaHBHN0tG?=
 =?utf-8?B?MkZXaDFBTDRIM0lkK3Bnb2JPRStHbUIzbmltQmhzOWM2RHBqMzNnNkxYNU4v?=
 =?utf-8?B?ZnQxemdUWGZuSGp2NEFpeTdqSTJidHJTT3hIdERtUE1uZEp4UVdSMDZNQzhl?=
 =?utf-8?B?YWJZcnBNR3FIcjAwTXFhdGZaMGhUZys3Wis3bC9EQ2VxYjQyZDFVMGoxY1Nn?=
 =?utf-8?B?TC9ndVN6SFNFUGdFWURQV1ZETVFkUmV0NURLaE5GQkpuQkRqSit4OUh1NnEr?=
 =?utf-8?B?RnN4WXRqd2dyUWJiK1RiRGd5WXc1WUxMU3FqZjVhc2EyRUc3a1V5RDdhK1NO?=
 =?utf-8?B?WFFxZGtRVDBsaUVMeVJEV2ZXbDdtRUt0NzNFVzdnWDFHbFg4b1dwYmxwRXZU?=
 =?utf-8?B?UnNHUlNKNVpPTGJjV1YxZUh0RFd1T2NNNHJwdUVCcm85eks2eWN5RDJoZDA2?=
 =?utf-8?B?dTdRUDcyZjBLbEJFQkFpMDV4SG1YWmZsU1lVMldlOXVWUk1sVGZzUzlBOWcv?=
 =?utf-8?B?eEl4N2Q2MkJqYndFcjhVa0praFZIOVdYeWNiSENIUFJXTDZCMGNtRzlhb0l1?=
 =?utf-8?B?Tk54OWlrdmJPUGJ1elBUQ1VleE41dnd2dmNSSi9xV2NsL2p4bEJhekg5L2VJ?=
 =?utf-8?B?Nks3UlEzUmJObmNxL0ptTk40blg5d3ZIWWRsUS9McE1rQUF6cHBjNjNPcVZt?=
 =?utf-8?B?NnJLS0RUbkd6SWpoaG8vS28ycXJwRjkxaE1UM0JKYWIwTXd2VDVIRVZYSGhn?=
 =?utf-8?B?M0x2bWxzZm1ObGNJWmo2dXdCODJmTk51K0VVREdqZE9xL1ZqZUNrU1pxYWs1?=
 =?utf-8?B?VkNDaW1tSk5oKzRxZDJvTzdOODZKem4xUjRIeGg3WmY0dU1aVGsxcEwvZ2tm?=
 =?utf-8?B?ckdxRnF2ZkVMQnhuNmpjQUdDbHVtbCtHZUpOTGRMVG1ONFFRYnZRSCs4bUpR?=
 =?utf-8?B?WTlseXJmMlVjYVRlUS9lV2hydFBrS1Q0M3Y4YnlWYkhxLzcyTUZhTVZ4ejVa?=
 =?utf-8?B?aFRCUDdqZ2cxUkMrSllNdzRwVXJ2YWs5cXkvNHpjbjUvd2wrNmVPUmszSURJ?=
 =?utf-8?B?amhOVGk1REpOK3p0NDNFOC82OUJRZmtrZ2Iybk40cjg3QWhEU3dDZ2R4bC9i?=
 =?utf-8?B?U1FKcXVHR3lPejROejhxclVZbUd6em9kMzcyVXdpQkNET0R3QVJWTjBIUE9F?=
 =?utf-8?B?Wnd4UVZSRzZuOXErcXJFZnBwelkwQyt6Rk8vb3I0RTFEOXhzVy9QR2wyZmNn?=
 =?utf-8?B?ekhKMmM0d1NrSHFLeHEvWC9xc1FjbHIzcVhrZVlOMGMvT0NYSGVvbnBMa2NY?=
 =?utf-8?B?ckJOeGh4STNnUGViR1l0eFlKanVRNi9UazRGS1pUNmg1VDVnQlB0NzFSS3pV?=
 =?utf-8?B?RXBIL01NL2RPQ0Fic0RTUGVyUDh5SVJrSDd4YUE4dzlGZkozWUh0Yy9NR1Fh?=
 =?utf-8?B?SVhJSHhCY0twbHRpWDVLMzFPYU1zSjVSVWR0R1NaKzNFTGtFb25WNzczVnU1?=
 =?utf-8?B?dkR1REhiMldsU0I0dHVOQVpxWnBQS3pRVlVEZGdCalMyTWxrRUFCRmZScFJD?=
 =?utf-8?B?QkIrT1AvcUIvZXpodXArdXVZYTUrYkZQM2NsbzlBQk5aWmJmeC9PMytIUmJJ?=
 =?utf-8?B?TmFYRW5IWDhESkxZemFPRXdTTnNSZDRuOUVVS0MranlVdENOUENVNkgrcWNE?=
 =?utf-8?B?cy9QclJuVkdlblZJR2lxayt5dGZGTitOMEttUGlkZWpsL0xrVHIzMHBiUlNF?=
 =?utf-8?B?N2h1ZktOM2dmYVRPRWZHc1dTOHphemlpMmNsdmxtbnhzNlVvR3Q0YWxKREVU?=
 =?utf-8?B?aFFBclowOE5DZGh0MlBDN0VyZm03QkVMeEVRV2taSEV6cVgwVGNIT1hSNjlO?=
 =?utf-8?B?RWJITS80bzNmSmFQOW92U1F5dERha1dKUjFHbTN5dlZrR3dJU2VhQWhoeHla?=
 =?utf-8?B?R2hTc1A4ZCswbGxGY2JmSFdRNzlPRXZTalNKbEk0UEdJZ2Z5a0Y4MVBzZDFi?=
 =?utf-8?B?UDkydW93NWxZR2srbnRJV3UyWmNOeWxQS1BtLzdvUVlTbG5WNVpTN255UGVK?=
 =?utf-8?Q?iwcKwA0bc3VsdleXhpdNkz5+q?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2efcc24-6573-4daf-06cb-08db514af16c
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 May 2023 11:37:32.2785
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LYU7ECv3Smq7E1rdAioVQ2loSL++LxtNCETBu7V3VdsaIM/fe+LifMNCiJ26yh43M57Laeya7batxy75zg8qO61VXc2Ww/+ozL3+07dckFM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11039
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

SGkgS3J6eXN6dG9mIEtvemxvd3NraSwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
PiBGcm9tOiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5v
cmc+DQo+IFNlbnQ6IFdlZG5lc2RheSwgTWF5IDEwLCAyMDIzIDc6NTggQU0NCj4gVG86IEdlZXJ0
IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5vcmc+OyBUcmVudCBQaWVwaG8NCj4gPHRw
aWVwaG9AZ21haWwuY29tPg0KPiBDYzogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMu
Y29tPjsgQWxlc3NhbmRybyBadW1tbw0KPiA8YS56dW1tb0B0b3dlcnRlY2guaXQ+OyBBbGV4YW5k
cmUgQmVsbG9uaSA8YWxleGFuZHJlLmJlbGxvbmlAYm9vdGxpbi5jb20+Ow0KPiBSb2IgSGVycmlu
ZyA8cm9iaCtkdEBrZXJuZWwub3JnPjsgS3J6eXN6dG9mIEtvemxvd3NraQ0KPiA8a3J6eXN6dG9m
Lmtvemxvd3NraStkdEBsaW5hcm8ub3JnPjsgbGludXgtcnRjQHZnZXIua2VybmVsLm9yZzsNCj4g
ZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVu
ZXNhc0BnbGlkZXIuYmU+Ow0KPiBGYWJyaXppbyBDYXN0cm8gPGZhYnJpemlvLmNhc3Ryby5qekBy
ZW5lc2FzLmNvbT47IGxpbnV4LXJlbmVzYXMtDQo+IHNvY0B2Z2VyLmtlcm5lbC5vcmcNCj4gU3Vi
amVjdDogUmU6IFtQQVRDSCB2NF0gZHQtYmluZGluZ3M6IHJ0YzogaXNsMTIwODogQ29udmVydCB0
byBqc29uLXNjaGVtYQ0KPiANCj4gT24gMTAvMDUvMjAyMyAwODo1MiwgR2VlcnQgVXl0dGVyaG9l
dmVuIHdyb3RlOg0KPiA+IEhpIFRyZW50LA0KPiA+DQo+ID4gT24gVHVlLCBNYXkgOSwgMjAyMyBh
dCA5OjAz4oCvUE0gVHJlbnQgUGllcGhvIDx0cGllcGhvQGdtYWlsLmNvbT4gd3JvdGU6DQo+ID4+
IE9uIFR1ZSwgTWF5IDksIDIwMjMgYXQgNjoxMuKAr0FNIEJpanUgRGFzIDxiaWp1LmRhcy5qekBi
cC5yZW5lc2FzLmNvbT4NCj4gd3JvdGU6DQo+ID4+PiArDQo+ID4+PiArICBpbnRlcnJ1cHQtbmFt
ZXM6DQo+ID4+DQo+ID4+IFNob3VsZG4ndCB0aGlzIGhhdmUgbWluSXRlbXM6IDEgYW5kIG1heEl0
ZW1zOiAyIGFzIHdlbGw/DQo+ID4NCj4gPj4+ICsgICAgdGhlbjoNCj4gPj4+ICsgICAgICBwcm9w
ZXJ0aWVzOg0KPiA+Pj4gKyAgICAgICAgaW50ZXJydXB0czoNCj4gPj4+ICsgICAgICAgICAgbWF4
SXRlbXM6IDINCj4gPj4+ICsgICAgZWxzZToNCj4gPj4+ICsgICAgICBwcm9wZXJ0aWVzOg0KPiA+
Pj4gKyAgICAgICAgaW50ZXJydXB0czoNCj4gPj4+ICsgICAgICAgICAgbWF4SXRlbXM6IDENCj4g
Pj4NCj4gPj4gQWRkIGludGVycnVwdC1uYW1lcyBoZXJlIHRvby4NCj4gPg0KPiA+IElzbid0IHRo
ZSByZWxhdGlvbiBpbnRlcnJ1cHRzIDw9PiBpbnRlcnJ1cHQtbmFtZXMgZW5mb3JjZWQgYnkgdGhl
DQo+ID4gdG9vbGluZz8NCj4gDQo+IE5vLCBldmVyeSBjb25zdHJhaW4gb3Igc2NoZW1hIGNvZGUg
Zm9yIG9uZSBzaG91bGQgYmUgZHVwbGljYXRlZCBmb3Igc2Vjb25kLg0KPiBUaGVzZSBjYW4gYmUg
ZG9uZSBob3dldmVyIGluIGRpZmZlcmVudCB3YXlzLCBlLmcuDQo+IGludGVycnVwdHM6DQo+ICAg
bWluSXRlbXM6IDENCj4gICBtYXhpdGVtczogMg0KPiBpbnRlcnJ1cHQtbmFtZXM6DQo+ICAgbWlu
SXRlbXM6IDENCj4gICBpdGVtczoNCj4gICAgIC0gZm9vDQo+ICAgICAtIGJhcg0KPiANCj4gYnV0
IHRoZSBvdXRjb21lIC0gc28gaG93IG1hbnkgaXRlbXMgYXJlIGV4cGVjdGVkIC0gbXVzdCBiZSB0
aGUgc2FtZSBpbiBldmVyeQ0KPiBicmFuY2gvY29uZGl0aW9uLg0KDQpCdXQgdGhpcyB3aWxsIHJl
c3VsdCBpbiBkdXBsaWNhdGlvbiBvZiBpdGVtcyBpbiAyIHBsYWNlcyByaWdodD8NCg0KT25lIGxp
a2UgdGhlIGFib3ZlIGFuZCBvdGhlciBvbmUgaW4gY29uZGl0aW9uYWwgYnJhbmNoLg0KDQpFZzoN
Cg0KIGludGVycnVwdC1uYW1lczoNCiAgIG1pbkl0ZW1zOiAxDQogICBpdGVtczoNCiAgICAgLSBm
b28NCiAgICAgLSBiYXINCg0KYW5kDQouLi4NCg0KKyAgLSBpZjoNCisgICAgICBwcm9wZXJ0aWVz
Og0KKyAgICAgICAgY29tcGF0aWJsZToNCisgICAgICAgICAgY29udGFpbnM6DQorICAgICAgICAg
ICAgZW51bToNCisgICAgICAgICAgICAgIC0gaXNpbCxpc2wxMjA5DQorICAgICAgICAgICAgICAt
IGlzaWwsaXNsMTIxOQ0KKyAgICB0aGVuOg0KKyAgICAgIHByb3BlcnRpZXM6DQorICAgICAgICBp
bnRlcnJ1cHRzOg0KKyAgICAgICAgICBtYXhJdGVtczogMg0KICAgICAgICAgaW50ZXJydXB0LW5h
bWVzOg0KICAgICAgICAgICBpdGVtczoNCiAgICAgICAgICAgICAtIGZvbw0KICAgICAgICAgICAg
IC0gYmFyDQoNCkNoZWVycywNCkJpanUNCg==
