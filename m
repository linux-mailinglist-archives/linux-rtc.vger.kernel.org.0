Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D8B1722576
	for <lists+linux-rtc@lfdr.de>; Mon,  5 Jun 2023 14:21:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233367AbjFEMVB (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 5 Jun 2023 08:21:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233321AbjFEMU4 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 5 Jun 2023 08:20:56 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2093.outbound.protection.outlook.com [40.107.113.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9173EEE;
        Mon,  5 Jun 2023 05:20:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IGy/O/Xdto6uCtsKuJCKxnxpMCrUGbO+PQ7kz0ksFySdmwp5e6xu8UN+xaz6ZjyMshTKtZrye81UZj1EYWm6JJisVr1jot2W4WvVuCBTkzAGS1rzqa0Elf6dLRf50zEsz6uBmdoo5GEWEgPxIJ17vVf1fSeqo72FC+dThWFKvn+vqR/6/9IqClmflBhqIOLPm4D7PZcxPQfM2JPxNOMcFcyQ8ElfIzr26r+bzVUvfcI3RWx+R+neUCGpFSfgYwBrMxBSAYRHu0x1eRpRGEJDByyO/4RWiNlCTZthrw5usRsukfGV7OF1IhTF0cLZlwn6h7Q1wswjKZVz/gxAyFeMfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ec7Iim34ArWKproEdC9yoJA4+tnDfuzAks5Lp5XrRiI=;
 b=bkUl1YztWpa6HhR7z5k7xP3/eShAqDtUo6pKm9gkukqWqFsF1WkoR3mGxld8ncdtS8/KooSo8BRZtYiroHdPvNl1hXWcK7ciofMFlO3jQvcQxH7aorPVCIltVDnRJzHbG/+RAMoQnyQyo602AqfaiPQmwGBkuiagTZRFqgECrJyV86QX4t1U7mFvjdF9BkTRigqPhdt4/wq+W1mdBLu3NeaCi1kIR7WECoMUtrEzrahalgb1lrvZeLrFLtdCfMzQO/BWK9RZcJEg/0Awc8lJ1W7gZ9GxbcL9fEtxfl1xQS4ODCKmJYcF6Y0o1Q76TmEpjPGaV/D6383fyL9PuxiFxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ec7Iim34ArWKproEdC9yoJA4+tnDfuzAks5Lp5XrRiI=;
 b=J1eLGMI9akH1pNs/6vfXhDYjPtXDgQR+zdUhiGfV75twtT7EzFApmtjmmB5BIFIblTvXQFBfUGpOBo322m8VcBeEcBBeRBk9H0MVJsgvDT48R4X0vfW/sO/KaReIy2jvYs/D4tVn6NGrzVmAvCWeJ2cuEM5dxc3TEThTaZrOU6k=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS3PR01MB8682.jpnprd01.prod.outlook.com (2603:1096:604:151::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.27; Mon, 5 Jun
 2023 12:20:51 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2%6]) with mapi id 15.20.6455.030; Mon, 5 Jun 2023
 12:20:50 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v6 10/11] rtc: isl1208: Add isl1208_set_xtoscb()
Thread-Topic: [PATCH v6 10/11] rtc: isl1208: Add isl1208_set_xtoscb()
Thread-Index: AQHZlV4MVXWpErMMb0mrBYKh7WoGga98Ha0AgAAHpbA=
Date:   Mon, 5 Jun 2023 12:20:50 +0000
Message-ID: <OS0PR01MB5922596D6F55CDB88ACCBDD1864DA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230602142426.438375-1-biju.das.jz@bp.renesas.com>
 <20230602142426.438375-11-biju.das.jz@bp.renesas.com>
 <CAMuHMdXRM978LZYDQsmH4w5GLTYZE03F5+ZAKN5EQscx0AWgSw@mail.gmail.com>
In-Reply-To: <CAMuHMdXRM978LZYDQsmH4w5GLTYZE03F5+ZAKN5EQscx0AWgSw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OS3PR01MB8682:EE_
x-ms-office365-filtering-correlation-id: 415d28ed-3d04-4d03-e129-08db65bf4d0a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: I4Itl2bjGNY935jJdea+KfXUPNDamTZMszKPYlEXl1QTZKRw2T3GPXSLSeAUEdPLzj5dAkqfUpIXZZuMRV1YTJ8/AmT+D5LdH3UVJCQduauz+/fBDbDryCAivQGaBCc9eOvv7yl0nLOpEzmnp9bQrCn82bRPoq1otLCULz5jYuCPNvtkCWGaPTuzzGGOOM55weonNah0yYWjl+SoIns/pPIMk8OhPrVmG8w3BLbgEbmhLfW0xee+FeTFzYOP8VnODmaESDw5vVjuAG03lXWrrIspyNqEWv4tfsp1dHswc16QGxpaPdL+qeM2zJgDJ5v3XCHmlpeB5ZLAEAfCDZULKzkjIhTWaZ1fDDRrptjLO82suXiRbpF1VAjSwMjDgjppP3FnqqXwxEO83Iet8uD0BCbC+TRsCKJF+bmKRD6eMaJv0OLmZ7nu+jb3Ua2y+B7Tl1456wmYya0IBw3smPwpfw7CFfepMzwYTTCn3lVw+2WXvaoyWonCjjudF2jH0OGXZo67eWEr3eMl18l+NUUEXEJW7HAhTMv5bGHiQaSz4Yl9HoSLVREquhZ5MgJ8brCkXokLIgqqFFkSi2V2i06ZRz6ybFPoW3m7lskgVp4kMUHZp6LlthIlNqcoxrw9gjPxscqKIYdfs7kCu3F27S3FTQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(136003)(39860400002)(346002)(396003)(451199021)(76116006)(66946007)(66556008)(66476007)(64756008)(6916009)(4326008)(316002)(8936002)(8676002)(5660300002)(52536014)(41300700001)(54906003)(2906002)(66446008)(186003)(6506007)(53546011)(9686003)(26005)(83380400001)(71200400001)(7696005)(478600001)(86362001)(33656002)(55016003)(38070700005)(122000001)(38100700002)(309714004);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RnljbEZOUUVEanJIN09VcmhCMXYxeWlUZk1mZEFjR1hkUUpSL3FtbkNodVI2?=
 =?utf-8?B?NHVOWWlzK0xTdGYrSkFPRVBJSWZSMmhSbVNSS2hhN2pmL0krRXFmWUQxczhG?=
 =?utf-8?B?Rjk0dmcvWnh6NGM2aG9CRzVELy9SOGxJdkw0QjVhbnZwYTNidHFnK0V2aFNB?=
 =?utf-8?B?dmx1SFRYTDJHTHBORm5MT1ovbE1KTWlEVEdtYzY4bmY4dGZTdHpNRGFOM0Vu?=
 =?utf-8?B?Ti92YlUyL0RyUTdvdXRtOWNqa2hORzVuMkFHaGd4eE1tek9RUGx5M0VVVWMw?=
 =?utf-8?B?WDBVaWVreVFUdE1MTDVnZFNQMW1sZzNMSlMwNEZzQWExSWdPeHEvQWp4U0ow?=
 =?utf-8?B?WmZ2cXo2Q25FcDgrVWtFZ1JOVFpWTUJJd095dG5MOHc0aUdKOWF4ZGlSQW8w?=
 =?utf-8?B?UlA1VVJvUm9kdzFTZmlabGFQR2djak9ENUVTZzRvZm9qU1liVXVxeWc4V2RZ?=
 =?utf-8?B?QTJISmhGaHFlOXNqRXhMejZCTzFHcVc4UVFkK0I3VVdWTEUvRTNSRDlOVi84?=
 =?utf-8?B?Y0JBZTJNZTVuTmFoN0h3SGpRVTFsZW1KWnhvUE9jV0NiWDVHd2Zld0lXNndT?=
 =?utf-8?B?OTNCNCt2c1dzaWVZUWVldW54WlB5YkVQc1BiTFphSDlaMVhDWjFvVDc2Yzk5?=
 =?utf-8?B?dFVmYmRNQWdpcXJYMHVTSUgyUTZXbWJHS01OZXhsSW9uSGhnWkNJUGthNWNm?=
 =?utf-8?B?Vk9uR3Byd3BBNmlrbUsyS1hpWGxKMXRSZjZDUktqaHBJMURtdXdiamlZanQv?=
 =?utf-8?B?ZHgvM3ZIN0ttMFBBTFVPeVNMcHFHMVhqbWR0VXEwRTE1dURBdFcrcVJXbHhL?=
 =?utf-8?B?ZjBjRFdjKzFmOWkyU3dxWWRydDJYMXB6NFFuaXFpR2FsTXVGaU9OZ0hTUFEx?=
 =?utf-8?B?SWNxaFM1cnJmV1JkWnRIV3dmdndTT1lPSHNncE90aE9OWWVuVFpxeGJ5YVdF?=
 =?utf-8?B?c2JLeWNLS2F5WHZmZ3BIVExjc0tjWkFYbHpVdkdUMVM1OCtaejBDbGZTSDlQ?=
 =?utf-8?B?NS95alhjYXc3Uy9GUEJENU5zeVFoOGM2RElwUXBrWEYzdUdhRXFqN2luWGF1?=
 =?utf-8?B?RUpoZEJ0Q1B4M0E2ZWlIZktyeEtJNmIrTENKVjVsazMxaFNYZGxKWlI5Vkdo?=
 =?utf-8?B?eUlvS0dPS2F3YkN5a3E5aGJLa2IwNVVKcGRDRGlnVXV1WlBkTkhYdVhjdlV6?=
 =?utf-8?B?YnRKbkx2SUJ2a0toMnJXLzJaZFRvQkRyclljMi9iRy9QMUUrUCtEQXNVcWRO?=
 =?utf-8?B?RXJ6V1pRR3ZFUDBhQlBrNTk4Y0p3S2R5OXRYN0o2SHE4eU5lSTlKb20zUFNi?=
 =?utf-8?B?eFlsT1JDOHpEWFpvbWprN01kWVhaVlVsU0trWHFreC84OTBydStTTlZwc2R6?=
 =?utf-8?B?TWxCNWUrRFUzZFZKN0VVR3NoTEN0TkVWRXBzdHg1Q2FwQ2UvQkZ0Q252Mmg1?=
 =?utf-8?B?QnR3NUxlOGpOdXQwNVlvQTF2ek1IaUJYbU1PWURHRzBsb3ZzQlJKRHdTemd6?=
 =?utf-8?B?aXZBU1N1cU5RYXArUjV5Y3ZvOHNnanVxYmRpbVJZS0c4QnFxKzk1Yjh3cU94?=
 =?utf-8?B?cE9xRmNOQXlwMVEydlZya3hkNE9hdTdVSHNkdkRXTmVFWFo5TWh1NGRVNXBL?=
 =?utf-8?B?L2VUbXZKU3BmSFg2ak10aEZ3bHNCdytCSk9HN1lQOFhsZGNlL3FhdGxPZUNF?=
 =?utf-8?B?RTVGNzhGY21BcFdvRkZSUEpVZFVPK3BlK0J5RkdwMDhJblduMWtkaFBTTjA5?=
 =?utf-8?B?VGY3VmtXZmo3Tkd0SUhwbTNTUmdPVmNFRU05dUVVOGovQS9yOE5yYm9oRWNq?=
 =?utf-8?B?NjNNUlpqMW94T3YzUytVWmd5WGFNWEVtdndCbTRBQjg0TTliQ3doSXZGckNZ?=
 =?utf-8?B?TmVUdzREK2lSMjlIVEJlQXBzNGR2czFrRFVGc0hnVFRnSnJ4ZkNBU0ptc0Zv?=
 =?utf-8?B?SlFpdko5R2VHOW5OTlFaRzZRd0RRd09XcjNacWhVTXRHOE9seDJmbHlibjE2?=
 =?utf-8?B?dnYxZ1NHZHpYaWpGQkZjeUQ4ZFgyYkRzSWk1aEsvNERaL0pyL3pDSG85dFc5?=
 =?utf-8?B?R3ZqMlZTYzAvS1lXUWEzQzZOSDYwY2ludTd3K2pMMllFR3VEMXFJWE8wc3BO?=
 =?utf-8?Q?NHceLWIoxArBb2GZSAOEtcfMp?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 415d28ed-3d04-4d03-e129-08db65bf4d0a
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2023 12:20:50.8507
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /8LxkNHNuDSV+beRrOJ0pdhO4Un0OnEe5Ic32SLfQf0+De/GgWAkkxDoHYaY85ts129UvXkj3MjFufnayBuZ13Ty3nbV/EZ6972tyn1gK2U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8682
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjYgMTAvMTFdIHJ0YzogaXNsMTIwODogQWRkIGlzbDEyMDhfc2V0X3h0b3NjYigpDQo+
IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gRnJpLCBKdW4gMiwgMjAyMyBhdCA0OjI14oCvUE0gQmlq
dSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiB3cm90ZToNCj4gPiBBcyBwZXIg
dGhlIEhXIG1hbnVhbCwgc2V0IHRoZSBYVE9TQ0IgYml0IGFzIGZvbGxvd3M6DQo+ID4NCj4gPiBJ
ZiB1c2luZyBhbiBleHRlcm5hbCBjbG9jayBzaWduYWwsIHNldCB0aGUgWFRPU0NCIGJpdCBhcyAx
IHRvIGRpc2FibGUNCj4gPiB0aGUgY3J5c3RhbCBvc2NpbGxhdG9yLg0KPiA+DQo+ID4gSWYgdXNp
bmcgYW4gZXh0ZXJuYWwgY3J5c3RhbCwgdGhlIFhUT1NDQiBiaXQgbmVlZHMgdG8gYmUgc2V0IGF0
IDAgdG8NCj4gPiBlbmFibGUgdGhlIGNyeXN0YWwgb3NjaWxsYXRvci4NCj4gPg0KPiA+IEFkZCBp
c2wxMjA4X3NldF94dG9zY2IoKSB0byBzZXQgWFRPU0NCIGJpdCBiYXNlZCBvbiB0aGUgY2xvY2st
bmFtZXMNCj4gPiBwcm9wZXJ0eS4gRmFsbGJhY2sgaXMgZW5hYmxpbmcgdGhlIGludGVybmFsIGNy
eXN0YWwgb3NjaWxsYXRvci4NCj4gPg0KPiA+IFdoaWxlIGF0IGl0LCBpbnRyb2R1Y2UgYSB2YXJp
YWJsZSAic3IiIGZvciByZWFkaW5nIHRoZSBzdGF0dXMgcmVnaXN0ZXINCj4gPiBpbiBwcm9iZSgp
IGFzIGl0IGlzIHJldXNlZCBmb3Igd3JpdGluZy4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEJp
anUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPiBSZXZpZXdlZC1ieTogR2Vl
cnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT4NCj4gPiAtLS0NCj4gPiB2
NS0+djY6DQo+ID4gICogQWRkZWQgUmIgdGFnIGZyb20gR2VlcnQNCj4gPiAgKiBSZXBsYWNlZCB1
OC0+aW50IGZvciB4dG9zYl92YWwgcGFyYW1ldGVyLg0KPiA+ICAqIEludHJvZHVjZWQgaXNsMTIw
OF9jbGtfcHJlc2VudCgpIGZvciBjaGVja2luZyB0aGUgcHJlc2VuY2Ugb2YgInhpbiINCj4gYW5k
DQo+ID4gICAgImNsa2luIiBmb3IgZGV0ZXJtaW5pbmcgaW50ZXJuYWwgb3NjaWxsYXRvciBpcyBl
bmFibGVkIG9yIG5vdC4NCj4gDQo+IFRoYW5rcyBmb3IgdGhlIHVwZGF0ZSENCj4gDQo+ID4gLS0t
IGEvZHJpdmVycy9ydGMvcnRjLWlzbDEyMDguYw0KPiA+ICsrKyBiL2RyaXZlcnMvcnRjL3J0Yy1p
c2wxMjA4LmMNCj4gPiBAQCAtODA1LDEyICs4MTYsMzMgQEAgc3RhdGljIGludCBpc2wxMjA4X3Nl
dHVwX2lycShzdHJ1Y3QgaTJjX2NsaWVudA0KPiAqY2xpZW50LCBpbnQgaXJxKQ0KPiA+ICAgICAg
ICAgcmV0dXJuIHJjOw0KPiA+ICB9DQo+ID4NCj4gPiArc3RhdGljIGludA0KPiA+ICtpc2wxMjA4
X2Nsa19wcmVzZW50KHN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQsIGNvbnN0IGNoYXIgKm5hbWUp
IHsNCj4gPiArICAgICAgIHN0cnVjdCBjbGsgKmNsazsNCj4gPiArICAgICAgIGludCByZXQ7DQo+
ID4gKw0KPiA+ICsgICAgICAgY2xrID0gZGV2bV9jbGtfZ2V0X29wdGlvbmFsKCZjbGllbnQtPmRl
diwgbmFtZSk7DQo+ID4gKyAgICAgICBpZiAoSVNfRVJSKGNsaykpIHsNCj4gPiArICAgICAgICAg
ICAgICAgcmV0ID0gUFRSX0VSUihjbGspOw0KPiA+ICsgICAgICAgfSBlbHNlIHsNCj4gPiArICAg
ICAgICAgICAgICAgaWYgKCFjbGspDQo+IA0KPiBXaGF0IGFib3V0ICJlbHNlIGlmIj8gOy0pDQo+
IEJ1dCBpbiB0aGlzIGNhc2UsIHlvdSBjYW4gbWFrZSB0aGUgY29kZSBldmVuIHNpbXBsZXIgKGxl
c3MgaW5kZW50ZWQpIGJ5DQo+IHJldHVybmluZyBlYXJseSBhZnRlciBlYWNoIHRlc3QuDQo+IA0K
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldCA9IDA7DQo+ID4gKyAgICAgICAgICAgICAg
IGVsc2UNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICByZXQgPSAxOw0KPiA+ICsgICAgICAg
fQ0KPiANCj4gaWYgKElTX0VSUihjbGspKQ0KPiAgICAgICAgIHJldHVybiBQVFJfRVJSKGNsayk7
DQo+IA0KPiByZXR1cm4gISFjbGs7DQoNCk9LLCB3aWxsIGNoYW5nZSB0byB0aGlzIGxvZ2ljLg0K
DQpDaGVlcnMsDQpCaWp1DQoNCj4gDQo+ID4gKw0KPiA+ICsgICAgICAgcmV0dXJuIHJldDsNCj4g
PiArfQ0KPiA+ICsNCj4gDQo+IEdye29ldGplLGVldGluZ31zLA0KPiANCj4gICAgICAgICAgICAg
ICAgICAgICAgICAgR2VlcnQNCj4gDQo+IC0tDQo+IEdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVy
ZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtDQo+IG02OGsub3Jn
DQo+IA0KPiBJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwg
SSBjYWxsIG15c2VsZiBhIGhhY2tlci4NCj4gQnV0IHdoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5h
bGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nDQo+IGxpa2UgdGhhdC4N
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcw0K
