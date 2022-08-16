Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF097596113
	for <lists+linux-rtc@lfdr.de>; Tue, 16 Aug 2022 19:28:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231193AbiHPR2H (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 16 Aug 2022 13:28:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230456AbiHPR17 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 16 Aug 2022 13:27:59 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16D0E65672
        for <linux-rtc@vger.kernel.org>; Tue, 16 Aug 2022 10:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1660670877; x=1692206877;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=XdrUdlZdARiEIINc9AK6XwrwQkV7pa5wT/UluAT7X9k=;
  b=MzXSyLeAoRud8vw3Cete/NyyiyphUveGAF/93m40pFLqkyXcRwGWb0II
   ntXzOCiE/sF+Z0hyMq9XRmLuwVugEDtdagH2YBmZYLvToKG9TRKuXMfK+
   CMlgcHU+ScdxagOCYzw5InPn9xqlJFl0kVou2tORZp3ue8R0EWC0nskmS
   lexdkK2qYto8nUzX1McYja81Qgeed42vG0X/C2xp5iNoEukzZWp+JBGYL
   MGbqIao/xu7j3Y7kVAfWXrytcF9PEwWH1rokfXmaYj3++0fGH+vb/IkiO
   41NO65XCxEhx6A2yl1RZjSlDOSCbQgNKPt/GnvFbPhX/JnkzUIj1zWMI8
   g==;
X-IronPort-AV: E=Sophos;i="5.93,241,1654585200"; 
   d="scan'208";a="109306137"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 16 Aug 2022 10:27:57 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Tue, 16 Aug 2022 10:27:57 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Tue, 16 Aug 2022 10:27:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ilRr0R4/DMN9tlVDMcDwwBNaEnL3SVgQX/sxt9vXG7Z89t+XB7Qw+65p7c6CfGrR+NhRGp100Xcr4A7D1rwlWr6H8sOI9QhNcByl8Z7ZIOGpaAvTIvUYUT7uxAN4ZjoABSz+V3IC7zp+Mr1SNG/RwaHuCG+JwVVsc3IhTgZJ8RMSvdbTo9bCCKftB0A6wJezsg1LHU3tJFrOD7zbxVlBTBwS3OWXAHpRf7x64ezTYIqtdWjGxCz31ewRm5RSs7loUT/L8V0kJMXkConj6GP6Iy7oLr8uLK6/E5VrmARm/P7moEuwnSQjhmo7Dm1rlmMFWTIL93diG2ShLQn9iemusQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XdrUdlZdARiEIINc9AK6XwrwQkV7pa5wT/UluAT7X9k=;
 b=S/6dPf2mqzUukO7nWZi+nEdVpQdcVV1XMqt2/N6zgXpEjlG0xuUxEYz7FZI1BXUNnqulRnKv5EHvLPy9hfyuBiIncyqbarQpPJj6wmxcoBG/VR4khuGj6PIYNzBQzjI1Kc4t+9yZQp0EoOAYbD2F8GHmvC5HEVazXTgmvA20BnY3BPoIOIA3K7EzkZ35crAG7LFLPfOrqlkR3xkAzyOfzyl05L2fTp3Vrje9dbhq/u/334g9tXRCKr44gk6Vp5MKOvaYIN60oWS17LLi/FHs6bVkFkjWA0YsIMnZkq7iJqEyWo98UcRUXMJ1ZupaBfI3hJWh7HxBtg6UpS/4IyqJKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XdrUdlZdARiEIINc9AK6XwrwQkV7pa5wT/UluAT7X9k=;
 b=dMmEuiMRxSzBNAGiUICeXRxiS50jhg0Ib7VsJaZZ/0cdnse51ncceWOvGKdp2WKIfnJTbxly6KnPqfrujbpcftdvNF+ebL4SJZhBkqHzu1uAbgc5cTtp9O8S8cGBudKG3sqCdUOFBAGTKeQi74eqy0Qaorzvgxn4jBmsjzplHZM=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by DM6PR11MB3340.namprd11.prod.outlook.com (2603:10b6:5:56::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Tue, 16 Aug
 2022 17:27:51 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%8]) with mapi id 15.20.5525.011; Tue, 16 Aug 2022
 17:27:51 +0000
From:   <Conor.Dooley@microchip.com>
To:     <geert+renesas@glider.be>, <Daire.McNamara@microchip.com>,
        <a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>
CC:     <linux-riscv@lists.infradead.org>, <linux-rtc@vger.kernel.org>
Subject: Re: [PATCH] rtc: mpfs: Remove printing of stray CR
Thread-Topic: [PATCH] rtc: mpfs: Remove printing of stray CR
Thread-Index: AQHYsXsoFy3MJzNmoUOb8KqziB5IwK2xyA4A
Date:   Tue, 16 Aug 2022 17:27:51 +0000
Message-ID: <4d414583-1011-4f01-870e-5d3ad812109a@microchip.com>
References: <bce2ca405ef96b1363fd1370887409d9e8468422.1660659437.git.geert+renesas@glider.be>
In-Reply-To: <bce2ca405ef96b1363fd1370887409d9e8468422.1660659437.git.geert+renesas@glider.be>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1fa2eb1d-276c-44b4-6a3a-08da7faca56f
x-ms-traffictypediagnostic: DM6PR11MB3340:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GPgqRfxzRYUYBnyoIzrm9/YVOuL6uTA5TC92KYJ+GNLpJJkvBFBYrLb4wNfSQn6Ax2pRqcMGYuOxr0MVlx1L1uQzVkfJmkpbpLW5jW1mjn1w87RIGja+lYmJurrHPAht2+yXt7iaQApPxMK6NUWpUWycaFAzm6qLrZI/a93c2oCtJe+Amjfu/b1dNFJQPoXeDqP82YMIoX9VGhok3cm3BTrl7yuWhxQh3DCpCobMLuvcwi7MiWKu577C4gvVdRCw1jHCC1mL5i+ts6q6wiGR1CoRqaCDGnK1/GWfzavNL5Z2aGKJ4EnC4axVoYsehJq2tTo+ww+GVJ3fOD4Zl+JN1Q5R6/cAQD7um87lEZOEFaGBvPUZYfSfgcZ2M0inSx242ZqiP/+VRIYFy52vKjSKOssGLu8EMYF7TXUHpw1r66/ylWHuTgjYXoBCqfmXl+erCCRMaQKDK3STJKS8JpLhFyvuPXWrjWdaEZBmgzOonW793gtccxz2BZZGm7PNPOyYg/0NCSc2NMbf12W+TQKemCyKVmDx447sKh7vqEWUAmyFXgBdg/ZKFFNLt37V9D/ynoOV8XPcyjgwpydf++jE8qEf2y+rKHflzIP1R1l/ZPf31BZd56poVDhJBsIszQW49QYIBIwU7wX00xnrSqQdJg6sjabJGNTelpBhjEK3oPPBKfteayKUkib4agY0xvQvDevHhbvKKHNjyGf0LgmOm9bZI5r2cA7T6WQNCbKa5rOUhmrQ5R5wQyxBx7g888M+jIPOuKGXnO9sSxLSRQG5g/BpuX/oYizzvp3NCbokMRAUUVgqRIYtkMU52JZ36zKLltUABcrEFAoeJxSGa9NJO/Rk0t7ljRSqZd66oJVyflNdG8quHEbe73XwpCIaW9Ph
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(396003)(136003)(366004)(376002)(39860400002)(6506007)(41300700001)(6512007)(2906002)(26005)(478600001)(53546011)(6486002)(5660300002)(8936002)(83380400001)(186003)(122000001)(86362001)(38100700002)(31696002)(2616005)(76116006)(31686004)(4326008)(8676002)(91956017)(38070700005)(71200400001)(66556008)(316002)(66476007)(64756008)(110136005)(66446008)(36756003)(54906003)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZWlqb1dKWDVhZHM5Ynh0LzYvQVNBRDdnVElyUW9hOWc4ZWZCaEJzUHEvajJD?=
 =?utf-8?B?TEZqVC9KdWl1aktWZkxoUGZLYnRvREJSL1FaNjliYjBraU5mN0cvUU1vcGY4?=
 =?utf-8?B?OGlJbklIdkRPMkNHdFByT1dhakNtZXpIdVd6cGlOZ2NUTk96Wk5CS2sxUVhy?=
 =?utf-8?B?b2x6dDNCKzFvZlQwb2ttOWhDbCt2cUxBTzNva3UyS1N1V3BSL2VFYk0wVS9y?=
 =?utf-8?B?ZGd3WVgzMlVSUTV4K1BOTzBWWjcwZ2pTOWNMZDhKWnkwY24zaGxycXN0eUVl?=
 =?utf-8?B?K2Z1N2VBdjJSclF6cXBiRnNUQTJMOExHbHBRODkvTVI4UzRSNERtMEQ4TGhT?=
 =?utf-8?B?eUVqM09Dem9QWWFWQklMRlNLMzFpZXFoQW5nOHMwbTBpbVNBZkxmbkFEQ2lo?=
 =?utf-8?B?VUNVNW9MSU4vaElYSmc4TTd6SDB0V3NSdDc2VVdDMGp5M3ByNFBIYWdxRURM?=
 =?utf-8?B?OU9GUnNXRWorcmdKMFBtdGhQZTV5Q1lCWGdBV0pPTTBWeWM2OGNNdXRRbHBj?=
 =?utf-8?B?V1dZVkhKcEFvZ1hMUC9DZzFWSmM1c0wrdG1uYzlPeXlNbFkvSDZramRmTlUr?=
 =?utf-8?B?RmtmcDFNV1gvOUJtZmFJc2RtV0FDRDhYSnQzRWFxNVZWc2VFdEpaMFFHcU9Q?=
 =?utf-8?B?ZllmeU1vOXh4SzEwZ0s5NjJwSDd1THN1ZFNvMXBaVVhWTUEwNUhkREg0Q2Jo?=
 =?utf-8?B?Y2NGUi9mbWlkK2I0MkNFb3ltQmQxc0tXWlZhR0NmQ1dnZkt2RmxQSW14cUdT?=
 =?utf-8?B?b2pDTWRZcjhpdk05VzVIK1dKcTN2TlpJSHRmZHpYbEF6d3ZONCtHd2txMlpq?=
 =?utf-8?B?bG92NGhQci9zWGsxaVVCWXVVbS96NnVvMW1iRlU3N1J5VG9FVS9LbmJ2bjA3?=
 =?utf-8?B?T0tyWk0wS3I1TCtCUVRLRzFZc0ZGbUJzQ2JnRFhESTVIaE5hbUUwK0ZoTHNy?=
 =?utf-8?B?UnU3dlRnR29xQURLRzd1MWMySi9nNFhJTk1qR3JzU01rWXgzd0hEYVR4dVh2?=
 =?utf-8?B?OVBPTGIxWEQ5ZkxRRmp0cHRpSmNEcndvMU5NOVlabkY5TVJxTEdtRDZvd3k0?=
 =?utf-8?B?Sys0UmlZSDh2TUxOSWpxSDcvRCtrK3NvR1hMUUxtbXNHc3haUzZoMVdJZnd6?=
 =?utf-8?B?NXJiNi9aT2xicHhVejdQbkJSSlV6ZTU3ZUV4aTNPay9yNGVuZ1RYNTd2RWNF?=
 =?utf-8?B?NjU4Tk5hNWh2WmJnT0U2a3M3MHNaZ3lGWElONy8rU0NoTFdKZWpSOVNCcXFx?=
 =?utf-8?B?VUJPSjhQbjMzbU9QbTRTemtGbTZHaWZtYUkzMWJSYmVIMTA1K1dUdURVM1Jx?=
 =?utf-8?B?ZnVSUUE3QWpHWjc1c2l6L0V4SWQxUnZyTFU5Wncwa0p3T2szQ0RabXV1OWhE?=
 =?utf-8?B?UTYxY0ZpV0F2dUJkRUFQblhWMW1vUlZKRWhCVjZCMVpBSTJtTDFlWmRHdFV1?=
 =?utf-8?B?UHVTUUQxdlJ2NmpOdmx3RG5WaW8wQXFzaCsyR2c2NFlETGxoV2t4R0FCVDBQ?=
 =?utf-8?B?ckQzaWQ1YkFGWUhabng4YWp5ekI0OG15OGJHcGl1blF2MTJNUkNOZ2NoQTNY?=
 =?utf-8?B?cExpck0zNC9Zck5xejFvZ21OaTdvdjR2OWtIUGZ4cllSMjZGYlMvNFdNa1ha?=
 =?utf-8?B?M09OM2FaL09vTmJRSGdtNlZ5MVI3WVpjTG9sZlhqS3lpWG04TGpaTXV4TTVs?=
 =?utf-8?B?Z0huNUIxOFlyK1dkc1Y1R3R5ajhWWXloVUIySnA3TzhiS0o4U0dGbG0vMCtI?=
 =?utf-8?B?djBFRVdvbjM4TXE1UnhOVDFTc0c4RUp2Z0dMUmhRTU1KeGNkaGR0M2poYWZr?=
 =?utf-8?B?dzdFZkY2ekpNN0FlZlZPNmFKbWlvVVBnalFhOE9SSDJqcTAwZFA5dHRNODQx?=
 =?utf-8?B?R3p1Q1pMRjhPWmZ1aXEvaDM4RkZpZm5KM3VFaXpVamlKb3lOM2VPOHlRUitm?=
 =?utf-8?B?RmJrdVUyNHFYNUV4YUZuR2VodkZ2U1M5TDh1VU5YRkpnTEVadWlTS3RYUGpv?=
 =?utf-8?B?SUpXSEJJSkZhQldSNzBIdEJrclFJL2xmT3pTbi9NQUV2bnJSRlVxakpnMUhr?=
 =?utf-8?B?NHR6ZjJndklOM0tick9TSEpGWFpQUjB1ckJxRkRCUTUyMjl4MHFoZXpGUFA0?=
 =?utf-8?Q?nBgaN4uObqKA0EhlkgpZ/bXwk?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <58667C5BEC725345AE6338FBFFFCDE76@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fa2eb1d-276c-44b4-6a3a-08da7faca56f
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2022 17:27:51.2835
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EOdBLT4Aml/CFT7PRj5QMgVcm+Nb2h11xo3Al5qNxlh1x/nNA3UQlxQKUyvcDw3WFN2w/GDXn7M8Z/jJmU6FbOqHxOVgD5tXEmcfgMF9JEE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3340
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

SGV5IEdlZXJ0LCB0aGFua3MgZm9yIHRoZSBwYXRjaC4NCg0KT24gMTYvMDgvMjAyMiAxNToxOCwg
R2VlcnQgVXl0dGVyaG9ldmVuIHdyb3RlOg0KPiBFWFRFUk5BTCBFTUFJTDogRG8gbm90IGNsaWNr
IGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBrbm93IHRoZSBjb250ZW50IGlz
IHNhZmUNCj4gDQo+IER1cmluZyBib290LCB0aGUgZHJpdmVyIHByaW50cyBvdXQgYSBzdHJheSBj
YXJyaWFnZSByZXR1cm4gY2hhcmFjdGVyLg0KPiBSZW1vdmUgaXQsIHRvZ2V0aGVyIHdpdGggdGhl
IHByZWNlZGluZyBzcGFjZSBjaGFyYWN0ZXIuDQo+IA0KPiBXaGlsZSBhdCBpdCwgY2hhbmdlIHBy
ZXNjYWxlciB0byAidW5zaWduZWQgbG9uZyIsIGFzIHJldHVybmVkIGJ5DQo+IGNsa19nZXRfcmF0
ZSgpLCB0byBhdm9pZCB0cnVuY2F0aW5nIHZlcnkgbGFyZ2UgY2xvY2sgcmF0ZXMsIGFuZCB1cGRh
dGUNCj4gdGhlIGZvcm1hdCBzcGVjaWZpZXJzLg0KDQpJZiB5b3UgbWFuYWdlIHRvIGludG8gTGlu
dXggd2l0aCBhIHJlZmVyZW5jZSBjbG9jayB0aGF0IGhpZ2gNCmxldCBtZSBrbm93IEFTQVAgOykN
Cg0KPiANCj4gRml4ZXM6IDBiMzFkNzAzNTk4ZGMxOTkgKCJydGM6IEFkZCBkcml2ZXIgZm9yIE1p
Y3JvY2hpcCBQb2xhckZpcmUgU29DIikNCj4gU2lnbmVkLW9mZi1ieTogR2VlcnQgVXl0dGVyaG9l
dmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT4NCj4gLS0tDQo+IEFwcGFyZW50bHkgdXBkYXRp
bmcgdGhlIFJUQyB3aGVuIERlYmlhbiB1c2Vyc3BhY2Ugc3RhcnRzIGZhaWxzLCBjYXVzaW5nDQo+
IGFuIGluZmluaXRlIHN0cmVhbSBvZjoNCj4gDQo+ICAgICBtcGZzX3J0YyAyMDEyNDAwMC5ydGM6
IHRpbWVkIG91dCB1cGxvYWRpbmcgdGltZSB0byBydGMNCj4gDQo+IEluY3JlYXNpbmcgVVBMT0FE
X1RJTUVPVVRfVVMgZnJvbSA1MCB0byA1MDAwMCBkb2Vzbid0IGhlbHAuDQoNCkkgZGlkbid0IHNl
ZSB0aGlzIG9uY2UgZHVyaW5nIGRldmVsb3BtZW50LCBub3Igd2hlbiBJIHRlc3RlZCBiZWZvcmUN
CkkgbGVmdCB3b3JrIHRvZGF5LiBUZXN0ZWQgd2hlbiBJIGdvdCBob21lLCBoYXBwZW5lZCBvbmNl
IHRoZSBmaXJzdA0KdGltZSBJIHRyaWVkIGl0ICYgbmV2ZXIgc2F3IGl0IGFnYWluIGFmdGVyIHRo
YXQuLi4NCg0KSSdsbCB0YWtlIGEgbG9vayB0aGlzIHdlZWsgYW5kIHNlZSBpZiBJIGNhbiBmaWd1
cmUgb3V0IGEgY2F1c2UuDQoNCkFzIEkgbWVudGlvbmVkIG9uIElSQywgSSB3b25kZXJlZCBpZiB0
aGVyZSB3YXMgYW4gaW50ZXJhY3Rpb24gYmV0d2Vlbg0KdGhlIEhTUyB5b3UncmUgcnVubmluZyAm
IHRoZSByZXNldCBjb250cm9sbGVyIHNlcmllcyB0aGF0IHlvdSBhcHBsaWVkLg0KDQpJIGxvb2tl
ZCBiYWNrIGF0IHRoZSB0aGUgSFNTLCBhbmQgdGhlcmUgd2FzIGEgcG9pbnQgd2hlcmUgaXQgZGlk
IG5vdA0KdGFrZSB0aGUgUlRDIG91dCBvZiByZXNldCAtIGJ1dCB0aGF0IHByZWRhdGVzIHRoZSB2
ZXJzaW9uIHlvdSBoYXZlDQooMC45OS4xNikgYnkgb3ZlciA2IG1vbnRocy4NCg0KSSB3b3VsZCBz
dGlsbCBiZSBxdWl0ZSBpbnRlcmVzdGVkIGluIHNlZWluZyBpZiBpdCByZXBybydzIHdpdGhvdXQN
CnRoZSByZXNldCBzZXJpZXMuDQoNCg0KPiAtLS0NCj4gIGRyaXZlcnMvcnRjL3J0Yy1tcGZzLmMg
fCA3ICsrKy0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDQgZGVsZXRp
b25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ydGMvcnRjLW1wZnMuYyBiL2RyaXZl
cnMvcnRjL3J0Yy1tcGZzLmMNCj4gaW5kZXggZjE0ZDE5MjVlMGM5NGRmYi4uOTQ0YWQxMDM2NTE2
NGM0ZCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ydGMvcnRjLW1wZnMuYw0KPiArKysgYi9kcml2
ZXJzL3J0Yy9ydGMtbXBmcy5jDQo+IEBAIC0yMzMsNyArMjMzLDcgQEAgc3RhdGljIGludCBtcGZz
X3J0Y19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiAgew0KPiAgICAgICAg
IHN0cnVjdCBtcGZzX3J0Y19kZXYgKnJ0Y2RldjsNCj4gICAgICAgICBzdHJ1Y3QgY2xrICpjbGs7
DQo+IC0gICAgICAgdTMyIHByZXNjYWxlcjsNCj4gKyAgICAgICB1bnNpZ25lZCBsb25nIHByZXNj
YWxlcjsNCj4gICAgICAgICBpbnQgd2FrZXVwX2lycSwgcmV0Ow0KPiANCj4gICAgICAgICBydGNk
ZXYgPSBkZXZtX2t6YWxsb2MoJnBkZXYtPmRldiwgc2l6ZW9mKHN0cnVjdCBtcGZzX3J0Y19kZXYp
LCBHRlBfS0VSTkVMKTsNCj4gQEAgLTI3NSwxNCArMjc1LDEzIEBAIHN0YXRpYyBpbnQgbXBmc19y
dGNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gDQo+ICAgICAgICAgLyog
cHJlc2NhbGVyIGhhcmR3YXJlIGFkZHMgMSB0byByZWcgdmFsdWUgKi8NCj4gICAgICAgICBwcmVz
Y2FsZXIgPSBjbGtfZ2V0X3JhdGUoZGV2bV9jbGtfZ2V0KCZwZGV2LT5kZXYsICJydGNyZWYiKSkg
LSAxOw0KPiAtDQo+ICAgICAgICAgaWYgKHByZXNjYWxlciA+IE1BWF9QUkVTQ0FMRVJfQ09VTlQp
IHsNCj4gLSAgICAgICAgICAgICAgIGRldl9kYmcoJnBkZXYtPmRldiwgImludmFsaWQgcHJlc2Nh
bGVyICVkXG4iLCBwcmVzY2FsZXIpOw0KPiArICAgICAgICAgICAgICAgZGV2X2RiZygmcGRldi0+
ZGV2LCAiaW52YWxpZCBwcmVzY2FsZXIgJWx1XG4iLCBwcmVzY2FsZXIpOw0KPiAgICAgICAgICAg
ICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+ICAgICAgICAgfQ0KPiANCj4gICAgICAgICB3cml0ZWwo
cHJlc2NhbGVyLCBydGNkZXYtPmJhc2UgKyBQUkVTQ0FMRVJfUkVHKTsNCj4gLSAgICAgICBkZXZf
aW5mbygmcGRldi0+ZGV2LCAicHJlc2NhbGVyIHNldCB0bzogMHglWCBcclxuIiwgcHJlc2NhbGVy
KTsNCj4gKyAgICAgICBkZXZfaW5mbygmcGRldi0+ZGV2LCAicHJlc2NhbGVyIHNldCB0bzogJWx1
XG4iLCBwcmVzY2FsZXIpOw0KDQpUQlFILCB0aGlzIGRvZXMgbm90IG5lZWQgdG8gYmUgYSBkZXZf
aW5mbygpIHByaW50LiBJIGRvbid0IHRoaW5rIGl0DQpwcm92aWRlcyBhbnkgdmFsdWUgdG8gYSBy
ZWd1bGFyIHVzZXIuDQoNCkVpdGhlciB3YXk6DQpSZXZpZXdlZC1ieTogQ29ub3IgRG9vbGV5IDxj
b25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4NCg0KVGhhbmtzIGFnYWluLA0KQ29ub3IuDQoNCj4g
DQo+ICAgICAgICAgZGV2aWNlX2luaXRfd2FrZXVwKCZwZGV2LT5kZXYsIHRydWUpOw0KPiAgICAg
ICAgIHJldCA9IGRldl9wbV9zZXRfd2FrZV9pcnEoJnBkZXYtPmRldiwgd2FrZXVwX2lycSk7DQo+
IC0tDQo+IDIuMjUuMQ0KPiANCg0K
