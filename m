Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C76B64FBD00
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Apr 2022 15:25:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346461AbiDKN2B (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 11 Apr 2022 09:28:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346465AbiDKN1b (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 11 Apr 2022 09:27:31 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2CF13B57E;
        Mon, 11 Apr 2022 06:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1649683516; x=1681219516;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=6N+NsFsKt0nqXYOsrX9XHv74oBnoAwjbYgz7iLQrCTI=;
  b=1+HyS+I2xn5haokLLF30S595tx1AcvYlEOnEfV+Flj35dyzpAN/HzmXq
   oyYCyrcyjsYVEWild/ZQ6ifvNhEIJ711kPrfx0rSdtafFOPxuFWHzN56u
   5eKX4VwkQ0uscfDgtvk4hAXLWq4REEWc4umSog5SBOWAZGbgtJDFxPycO
   r01Z8QkfSYyvdcCsuDNYjLkk7OObtAJo7HExyUDZ1TQ1QS7P/QTg9oX8O
   FhOcb0wAIBxeqUVWLss9YUNPzJFS096Gv073FGqzr1a+HcL9bro/Mfu7K
   srCt0TKH4CDSmPM7B+C2J6mtRLB7GcIjQTlYW4RyeVmPe+B5BuX04LWc1
   w==;
X-IronPort-AV: E=Sophos;i="5.90,251,1643698800"; 
   d="scan'208";a="169175744"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 11 Apr 2022 06:25:16 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 11 Apr 2022 06:25:16 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Mon, 11 Apr 2022 06:25:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RPtLFxk2j4tYqPqxXuvAgNGY799OEiMJIpOSzi5kkDhkn3puRVDS0Tm+GRAtHPk1Ee3mb4XdbZ7rsT3Y5hpGU8cRM/He8TXnFntXq7+Qrx9bMJx9BnUT9kmhnNN39bT5RODv68c2V+EaLuBTYbEUcoP1VnlmIO35MxNlli+Gind2CBo/liow0pHyTpW3Nfn3sUZywcDKC96f3TPYF4SznkzWEft5n8qH4Hx5U0E3Q06f2Uc9KY2G+1wchFG0z7EHobOL0jGCXl9S/njtRo9BZu2xbfN6o3X6macNgySd/bN6tS7Sw9sbOkV1lvtqfca63KZ7Zs5HJSZHCPWsBBWXrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6N+NsFsKt0nqXYOsrX9XHv74oBnoAwjbYgz7iLQrCTI=;
 b=AsiQnc/FK+rc+n+7h+DgGhJzK0n/kyxVbMVXFqbE8IeN6AU5xDIlSSKaebMwFwU71JXSba1zyEbrbngHYbigPi4SQ5+Emi8MT9aPWy8iNCZQA3w4gsBVl58bZAioFdWZ6GKNBFzncXfxIFZ0foYWd3yDcggeUTAmGrnLOhZ4f8jtaEpG7Yn1T9MsA5pLIscMvuM+8hHF9TrPwhu1xA1kZ3vzlmGNxpRS/lE6z+DMpzs9eDbPh0D733BMHLFHTaegJi+n/4QvGrm6L0Xeg5+CeCzM1q1JzPvbHgWINxaDw+kvAkRja8xRH9El1l6SjrDpH17Vx/GrvSGFbAZLW/LbDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6N+NsFsKt0nqXYOsrX9XHv74oBnoAwjbYgz7iLQrCTI=;
 b=WN7STFoZ5l13OFrasQ1+i7HmqgKQIJBC7ZXaJnUpy/ZPpCgwtgdb3QiZHgH3whV9k4xAyPdbiNzN5Xm/Q8QaTWT+2bQAdXuApHWYxYwHGFJp1Hl/GXLGPBvQAT56HkjSLgqQNB4VP3tbk9SqRSumxfBP6Dfdb22XFthilpMf6sg=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:95::7)
 by SJ0PR11MB5938.namprd11.prod.outlook.com (2603:10b6:a03:42d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Mon, 11 Apr
 2022 13:25:06 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::dc95:437b:6564:f220]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::dc95:437b:6564:f220%8]) with mapi id 15.20.5144.029; Mon, 11 Apr 2022
 13:25:05 +0000
From:   <Conor.Dooley@microchip.com>
To:     <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <aou@eecs.berkeley.edu>, <paul.walmsley@sifive.com>,
        <palmer@rivosinc.com>, <a.zummo@towertech.it>,
        <alexandre.belloni@bootlin.com>, <robh+dt@kernel.org>,
        <krzk+dt@kernel.org>
CC:     <Daire.McNamara@microchip.com>, <linux-rtc@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v2 9/9] riscv: dts: microchip: reparent mpfs clocks
Thread-Topic: [PATCH v2 9/9] riscv: dts: microchip: reparent mpfs clocks
Thread-Index: AQHYTYK4eg1gx8fXXE+CK0jbXT7VJ6zqs/yA
Date:   Mon, 11 Apr 2022 13:25:05 +0000
Message-ID: <580d91d4-f716-61f7-5a87-11c9a2240053@microchip.com>
References: <20220411085916.941433-1-conor.dooley@microchip.com>
 <20220411085916.941433-10-conor.dooley@microchip.com>
In-Reply-To: <20220411085916.941433-10-conor.dooley@microchip.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 31205013-4fd0-4a30-4754-08da1bbeb141
x-ms-traffictypediagnostic: SJ0PR11MB5938:EE_
x-microsoft-antispam-prvs: <SJ0PR11MB5938B61BCA314ADD6C529AD298EA9@SJ0PR11MB5938.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rwghzUEtwujy0Ic8E+5KxqnbyYBCB6qdKwVkIqvaEITv06YnDvynlQMt2biHSjqJBDkHbMltjvBabfJ+jI43Xjf5sL3I/Xi+kFSZQJoq+bmi5WIQWwp9tDJ2CVfpZlWb203FUK72xPz+Rq9NLj8/PD3tsR6sj/UpK1HAcZiRGAdRiIi9vvVp2T4CsFK/78TuvWzMuciIryRO1dnab5Nl+nwjrqege1nEnq/iwpCyfXga560uzRH2iv+j1Q7KqsUq1y9sI6K4js7W3MLNuk3cuW/roskXLDVzHQaaX+E5KY7vZC7l2INiYY1vay0XKJ6EP0yaSVljVxspWnFPvU9+0fQJ6FP+OtovVgoRfdog5RkZD6MvB5hWNsAUJiYw8JuffKxThmG1GKBAcxqI6vZRjO5GDCZyhUu+6HfPuHozqu4MljjuHbvMH1hoL8T36puSkPVBeu/Blbx8tIi7zdAEf1Nrxgj2h822bWTH9MmbBo/HX18TwXj4ztWcSpGr8kIkH2FB0QopyavMgEBMWOLmOXHreZQRIWZMm2XM8q95oibx/uECkgj8MDJfmgvLidmLDHxXxrzWYo7ssM3kMpQ61Txr+NA+cz1pCdbfB1qvmeJ7P33GnGtpu5qXrc6ZY3nB0DwalNHUW5h3J/EhPzI02jbdPYjrjN2CJZjyPWzMi32BkLxSwXq+nIfIfDkHj3S79iVLuTfJ0zfhH0iNF2fOJmkgIM+gv2CEAfhUERhBJbj/Ls5CWH9BBCAUlvOmqayLLGxLofS8ZtUmnxuMkxLuJg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(86362001)(38100700002)(7416002)(8936002)(2906002)(122000001)(31696002)(5660300002)(316002)(38070700005)(6512007)(53546011)(66476007)(26005)(6506007)(54906003)(110136005)(186003)(36756003)(71200400001)(6486002)(508600001)(2616005)(76116006)(66946007)(66556008)(91956017)(8676002)(64756008)(66446008)(4326008)(31686004)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bmdoMEtQdTlQT2tWTkZtL3FRaHJQV3h3LzNDc3hQbmRyZjhSSnRydUErb0ti?=
 =?utf-8?B?N21ta21XSHl3d0FQd1hHZk56dnFKdnVySGJOWUJoMDRiV092NGh6QXE2SHR6?=
 =?utf-8?B?WERZZVpsOG1hV0ZlT1FxK2tUOXlkYlluK00vc0NZVG44K3MwZHdxcWN1a2NQ?=
 =?utf-8?B?cStJRDYzTndkNENjSktHMGVaN0VVQ0hMTVhBZWhlbWV4TEYxb2FybkwwMllx?=
 =?utf-8?B?VTR0ZG52VlFuV2RiMVAzT3hBeExLZWFVYzNESlMwc3BBem9pNDZ6clVyRGdE?=
 =?utf-8?B?ZllLL3J0clRWN3V5YlFUWkZlVDdvVFpPT3BZWFdtb2RJWlovUWVaU2Fic0VE?=
 =?utf-8?B?a0VXTVRNc0I5NGd3V0tYVS9aRFd2ZDh1ZnA3WWZ4Vi9ZZjR3ZHpkOVc3UGEz?=
 =?utf-8?B?a0hyRzB4VUVUSUxUV1o2L0t0ZzFvb2VRRnNsQnhWSlJrZ1VxTkFXMVc2SGlU?=
 =?utf-8?B?VDFlZXpydzlLa1Y3eXQrRkZJVHRHWG9laEx2aHB3ZW56bnlyYUROYVJKcEti?=
 =?utf-8?B?TXZVeitScVBCRnNnanNYNTFqNDZiNnJiQ2pqRG1DTjF1RC83NnYxQnVsZjFa?=
 =?utf-8?B?RjRGa29YTEQxaTYveWx3aUY0MkNFcExhUkFkK3dxZGxsa1dvRk40c3paSkVs?=
 =?utf-8?B?UElSSEU2RHVNU1FwOEZOQWYvQUhoN3hwL0F4Y3dIN2U3VjZRbE03VlVtbERY?=
 =?utf-8?B?SHdrMzBHKzF2ZVhuUkh2MDYzcmNTeE40RmsvZmtMZlhxK1dPbm5SeFo3ZHM1?=
 =?utf-8?B?QkJoY0E5K2FzRVZOcUhBQndpcGJWZldadElnYittT0ZlNDVoVzBXZkhYKzBh?=
 =?utf-8?B?aUxZUTU4ZHRYY0x1WlZiby95dWJtNXFFSUQ4YXU5UUhwSFV6WGZ1eE9oUjhF?=
 =?utf-8?B?Mm1vTnhLNGplQm5GaDgyYlVLenNtejdmUW1JZXFwOFY5RlViaVVraUFVOUg0?=
 =?utf-8?B?NkM0dys2WGdKUXdFMFZPK2JLWjhxL3NoRjRuZzBuc0k4MFRYZEY3S3BIZkt0?=
 =?utf-8?B?Q0JWKzlEK254UEZDV3Z1ZTAyT3R5MEhLQm5oR3pSbVBKVWppcllzcngreU1z?=
 =?utf-8?B?Z0FvdUsvaitjZXVvdTIwUDk2M01qUTFUcm1kMGYxY2kvZGpMdGhiSnJVV2dk?=
 =?utf-8?B?ZGJoZ2hINVhWR3BZZXB5RjhYZktSczgvMVlsaU9qa2RFaEdJU2Q0RkhVT2Zp?=
 =?utf-8?B?WVZ6eDZSeFo1T0ZjRG5kdTd3TVBOemhubFRodHJEMk5CYjhqY1NDNEFiclI5?=
 =?utf-8?B?cHcrWFlFbHk0U1J2a1pia29wQUp5RmNrY2xiRGJUUWJ4aW0rdkhwcDFGUldk?=
 =?utf-8?B?Z0hLK0JJd3JLTVh4b1c3NlVBMWhVVTZSZW51RXhZZGZMNmFNaVE5VTBEWUg1?=
 =?utf-8?B?N0RnZGpxMTgrbFNZYjhjNjZhSEtBa2tXTFdneitzRUtueUxZd0JNZnM0V3hr?=
 =?utf-8?B?cDJIQzRpdlVWM3hVMVJkbXFXbE94eTdlN0FJODNnejlPNWVGVDU4L1d3VWVx?=
 =?utf-8?B?TFA2WkE4VkVuc3BjeHI1cXRabnNnbzJKYWFHb0E2YXhLM1c5b2ZLU3JrQWIx?=
 =?utf-8?B?RWVWM3VHTktiOS9GN1B1SDBsTFIzcFFSSDdRZWtjUEU1bDhramtTdzJHZk41?=
 =?utf-8?B?N0hEZFVVZjV2bndNZWV4dlZWa3l6dzRKTjIxOEZqVzgraFBnanpJL3A2NFpN?=
 =?utf-8?B?QVdjY0ZJeXpORHFwK3pzSys1WndkWjgrVFB3NnA3cDZ2S3RSVnVYK0x1VFBI?=
 =?utf-8?B?cHA0enZvQXcrMlRCOEw2QkFyNHB2VmRnQVhVQmdKRm04TWxrUXZleU1hc1pp?=
 =?utf-8?B?ZmpXaFkvdVdQVk5aWGVSTVJDRlAveUExT1VXYkRPQXg1NkxCSndRV3NKZW0r?=
 =?utf-8?B?emJoYlFwcmw3SUt6ZkZTZDExZnpsWm0ydnNCbUNiRCtSL2JueFdXTklPYXFH?=
 =?utf-8?B?aDYvMGpZSVlYTTNkakVEZ1NsYkhrekxzODBUSHdVWkswajd4WjBOeDZYQWZQ?=
 =?utf-8?B?VWZoaVovazVjUFhibzFxZWllbVdIbzNReDZwQktobFVnREUwclhoMDRJb1Qw?=
 =?utf-8?B?bUZDYWYvOWZmQzg4T3M5bXRUN2RnS3N6QWxuZnRMV203dHI2dmtJNTJCR284?=
 =?utf-8?B?eUtFUVRBamlHeEtvWFJIMzdMOUxhMEJNY25pYVNNRDBoSnNnMjJJUzVLYmxO?=
 =?utf-8?B?NHhzS0x1T05qWlZwaExVb1o3SjFuQ1c1SUx1bVpzYUQyZVpvMmcwSlhLRXFG?=
 =?utf-8?B?czcxN2M3UDlkR09obkNrNW54UVBCcUpxQzVSaVhlaHVrazl6VDViWFYxc3pR?=
 =?utf-8?B?UGYwWUl0SG9Fa1Z5UEFCWVUwdjAvMlhTNnNkQWVJaXBpN3A0VU5NZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A5F44D0D95CFC64D96DE9E0D962B1C93@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31205013-4fd0-4a30-4754-08da1bbeb141
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Apr 2022 13:25:05.6508
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3ie0WO3rZ23L6na3A+kZCEvT68PwS7UAEdOUQl2ZDuQv3r1r1234lxE5haBVOdC5l2mfh2TNCgMQPW3nXS3t2ShxXpZjvplVURe8ByQ9uUU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5938
X-Spam-Status: No, score=-6.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

T24gMTEvMDQvMjAyMiAwODo1OSwgQ29ub3IgRG9vbGV5IHdyb3RlOg0KPiBUaGUgNjAwTSBjbG9j
ayBpbiB0aGUgZmFicmljIGlzIG5vdCB0aGUgcmVhbCByZWZlcmVuY2UsIHJlcGxhY2UgaXQgd2l0
aA0KPiBhIDEyNU0gY2xvY2sgd2hpY2ggaXMgdGhlIGNvcnJlY3QgdmFsdWUgZm9yIHRoZSBpY2lj
bGUga2l0LiBSZW5hbWUgdGhlDQo+IG1zc3BsbGNsayBub2RlIHRvIG1zc3JlZmNsayBzaW5jZSB0
aGlzIGlzIG5vdyB0aGUgaW5wdXQgdG8sIG5vdCB0aGUNCj4gb3V0cHV0IG9mLCB0aGUgbXNzcGxs
IGNsb2NrLiBDb250cm9sIG9mIHRoZSBtc3NwbGwgY2xvY2sgaGFzIGJlZW4gbW92ZWQNCj4gaW50
byB0aGUgY2xvY2sgY29uZmlndXJhdG9yLCBzbyBhZGQgdGhlIHJlZ2lzdGVyIHJhbmdlIGZvciBp
dCB0byB0aGUgY2xrDQo+IGNvbmZpZ3VyYXRvci4gRmluYWxseSwgYWRkIGEgbmV3IG91dHB1dCBv
ZiB0aGUgY2xvY2sgY29uZmlnIGJsb2NrIHdoaWNoDQo+IHdpbGwgcHJvdmlkZSB0aGUgMU0gcmVm
ZXJlbmNlIGNsb2NrIGZvciB0aGUgTVRJTUVSIGFuZCB0aGUgcnRjLg0KPiANCj4gRml4ZXM6IGZl
ZWIzODY4NTUyMyAoIlVwZGF0ZSB0aGUgSWNpY2xlIEtpdCBkZXZpY2UgdHJlZSIpDQoNClRoaXMg
aXMgbm90IHRoZSBjb3JyZWN0IGZpeGVzIHRhZy4gVGhlIG9uZSBJIG1lYW50IHRvIHB1dCB3YXM6
DQpGaXhlczogNTI4YTViMWYyNTU2ICgicmlzY3Y6IGR0czogbWljcm9jaGlwOiBhZGQgbmV3IHBl
cmlwaGVyYWxzIHRvIGljaWNsZSBraXQgZGV2aWNlIHRyZWUiKQ0KDQpIb3dldmVyLCB0aGF0J3Mg
dGhlIGNvbW1pdCB0aGUgUlRDIHdhcyBhZGRlZCBpbiBidXQgbm90IHRoZSByZWZjbGsuDQpDYW4g
SSBoYXZlIHR3byBmaXhlcyB0YWdzPyBUaGUgb3RoZXIgb25lIHdvdWxkIGJlOg0KRml4ZXM6IDBm
YTYxMDdlY2E0MSAoIlJJU0MtVjogSW5pdGlhbCBEVFMgZm9yIE1pY3JvY2hpcCBJQ0lDTEUgYm9h
cmQiKQ0KDQpBbHRob3VnaCB0aGF0IHNlZW1zIGxpa2UgYSBzaWduIHRoYXQgdGhpcyBzaG91bGQg
cmVhbGx5IGJlIHR3byBjb21taXRzLi4uDQoNCj4gUmV2aWV3ZWQtYnk6IERhaXJlIE1jTmFtYXJh
IDxkYWlyZS5tY25hbWFyYUBtaWNyb2NoaXAuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBDb25vciBE
b29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPg0KPiAtLS0NCj4gICAuLi4vYm9vdC9k
dHMvbWljcm9jaGlwL21pY3JvY2hpcC1tcGZzLWljaWNsZS1raXQuZHRzICAgICAgfCAyICstDQo+
ICAgYXJjaC9yaXNjdi9ib290L2R0cy9taWNyb2NoaXAvbWljcm9jaGlwLW1wZnMuZHRzaSAgICAg
ICAgIHwgOCArKysrLS0tLQ0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA1
IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvbWlj
cm9jaGlwL21pY3JvY2hpcC1tcGZzLWljaWNsZS1raXQuZHRzIGIvYXJjaC9yaXNjdi9ib290L2R0
cy9taWNyb2NoaXAvbWljcm9jaGlwLW1wZnMtaWNpY2xlLWtpdC5kdHMNCj4gaW5kZXggY2QyZmU4
MGZhODFhLi4zMzkyMTUzZGQwZjEgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvcmlzY3YvYm9vdC9kdHMv
bWljcm9jaGlwL21pY3JvY2hpcC1tcGZzLWljaWNsZS1raXQuZHRzDQo+ICsrKyBiL2FyY2gvcmlz
Y3YvYm9vdC9kdHMvbWljcm9jaGlwL21pY3JvY2hpcC1tcGZzLWljaWNsZS1raXQuZHRzDQo+IEBA
IC00NSw3ICs0NSw3IEBAIGRkcmNfY2FjaGVfaGk6IG1lbW9yeUAxMDAwMDAwMDAwIHsNCj4gICB9
Ow0KPiAgIA0KPiAgICZyZWZjbGsgew0KPiAtCWNsb2NrLWZyZXF1ZW5jeSA9IDw2MDAwMDAwMDA+
Ow0KPiArCWNsb2NrLWZyZXF1ZW5jeSA9IDwxMjUwMDAwMDA+Ow0KPiAgIH07DQo+ICAgDQo+ICAg
Jm1tdWFydDEgew0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9ib290L2R0cy9taWNyb2NoaXAv
bWljcm9jaGlwLW1wZnMuZHRzaSBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvbWljcm9jaGlwL21pY3Jv
Y2hpcC1tcGZzLmR0c2kNCj4gaW5kZXggM2I0OGI3ZjM1NDEwLi43NDZjNGQ0ZTc2ODYgMTAwNjQ0
DQo+IC0tLSBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvbWljcm9jaGlwL21pY3JvY2hpcC1tcGZzLmR0
c2kNCj4gKysrIGIvYXJjaC9yaXNjdi9ib290L2R0cy9taWNyb2NoaXAvbWljcm9jaGlwLW1wZnMu
ZHRzaQ0KPiBAQCAtMTQxLDcgKzE0MSw3IEBAIGNwdTRfaW50YzogaW50ZXJydXB0LWNvbnRyb2xs
ZXIgew0KPiAgIAkJfTsNCj4gICAJfTsNCj4gICANCj4gLQlyZWZjbGs6IG1zc3BsbGNsayB7DQo+
ICsJcmVmY2xrOiBtc3NyZWZjbGsgew0KPiAgIAkJY29tcGF0aWJsZSA9ICJmaXhlZC1jbG9jayI7
DQo+ICAgCQkjY2xvY2stY2VsbHMgPSA8MD47DQo+ICAgCX07DQo+IEBAIC0xOTAsNyArMTkwLDcg
QEAgcGxpYzogaW50ZXJydXB0LWNvbnRyb2xsZXJAYzAwMDAwMCB7DQo+ICAgDQo+ICAgCQljbGtj
Zmc6IGNsa2NmZ0AyMDAwMjAwMCB7DQo+ICAgCQkJY29tcGF0aWJsZSA9ICJtaWNyb2NoaXAsbXBm
cy1jbGtjZmciOw0KPiAtCQkJcmVnID0gPDB4MCAweDIwMDAyMDAwIDB4MCAweDEwMDA+Ow0KPiAr
CQkJcmVnID0gPDB4MCAweDIwMDAyMDAwIDB4MCAweDEwMDA+LCA8MHgwIDB4M0UwMDEwMDAgMHgw
IDB4MTAwMD47DQo+ICAgCQkJY2xvY2tzID0gPCZyZWZjbGs+Ow0KPiAgIAkJCSNjbG9jay1jZWxs
cyA9IDwxPjsNCj4gICAJCX07DQo+IEBAIC0zOTMsOCArMzkzLDggQEAgcnRjOiBydGNAMjAxMjQw
MDAgew0KPiAgIAkJCXJlZyA9IDwweDAgMHgyMDEyNDAwMCAweDAgMHgxMDAwPjsNCj4gICAJCQlp
bnRlcnJ1cHQtcGFyZW50ID0gPCZwbGljPjsNCj4gICAJCQlpbnRlcnJ1cHRzID0gPDgwPiwgPDgx
PjsNCj4gLQkJCWNsb2NrcyA9IDwmY2xrY2ZnIENMS19SVEM+Ow0KPiAtCQkJY2xvY2stbmFtZXMg
PSAicnRjIjsNCj4gKwkJCWNsb2NrcyA9IDwmY2xrY2ZnIENMS19SVEM+LCA8JmNsa2NmZyBDTEtf
UlRDUkVGPjsNCj4gKwkJCWNsb2NrLW5hbWVzID0gInJ0YyIsICJydGNyZWYiOw0KPiAgIAkJCXN0
YXR1cyA9ICJkaXNhYmxlZCI7DQo+ICAgCQl9Ow0KPiAgIA0KDQo=
