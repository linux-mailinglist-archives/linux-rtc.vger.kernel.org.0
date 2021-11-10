Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DAE044C2DF
	for <lists+linux-rtc@lfdr.de>; Wed, 10 Nov 2021 15:20:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232136AbhKJOW7 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 10 Nov 2021 09:22:59 -0500
Received: from esa.microchip.iphmx.com ([68.232.154.123]:23070 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231423AbhKJOW4 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 10 Nov 2021 09:22:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1636554008; x=1668090008;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=6y8LA+WfKtPylGcyjGQoyiyLYOcjTujCSkJ5CUyzX/Y=;
  b=f3Z/O7ZzkzjvML19eOMB6F0Rnqp3oMxwfJ+qgoMKAXR+pQC/baPFooT+
   xDsJNd8b8IS5pM39ILbt/PMiyL4cRICSEW20C7yJgKuuqKpnWYAa5F2Wt
   xLICuWQckC6NPM+JiXpvScDCdWsvu9DhzoW8RUhCsLYsjkTfmeQTFHPwh
   ymumiQygqOoCCOdLy/wgEQyMeSsBcpJbbPJUP2GM7vr4YedU2DqT7YHKR
   FRiM9wcPqWPBJ1GkIScK3+WAdDyT75/ylW/FtZu/fYZ8ZeKFeMvwQG9P3
   iDfMdcVHwtrWJLqU3HlDtM1Ic9K4kCIypSvo9rDijfTdLsfK9CvpQwdAs
   g==;
IronPort-SDR: BDqyY+owOs6Q2HCxAkHMRMY/obOXDZTYagFbfAIFrNHOmjJovojxcWjXLCR0zgiYiP8WklHcdB
 QTkhubLGIX2t5OvrujTNitd4VUZ5a+9F1o1xFGwah1t5svtUuWxRXFXCw2YrBuJLyoFIEUJv+e
 oFG9wA/XmZmQ/5WZKmxp5SW68ohnHb6K/zj1VxwXnHBXg8CcgVJ06XsX6fwdyuzJJ0TstyS8F/
 mq4yIToWHv2HSM9PvH+hJNuMb1if3YQX4ifoK0qSqJfECFffoXxxC6IpXlBr90qwPGMHKvdOGP
 HuBs6z5Bxj2fJIOlzI3RaM/j
X-IronPort-AV: E=Sophos;i="5.87,223,1631602800"; 
   d="scan'208";a="136123241"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 10 Nov 2021 07:20:07 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 10 Nov 2021 07:20:06 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14 via Frontend
 Transport; Wed, 10 Nov 2021 07:20:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S2RFe9WifUESeDBeoflfraW9sM3SPFM+47FzsVvWUvnyrFEDwqmUQ7IDeMNTcGlQXPlAh8chX1Hee8LOoGxTMMxK1E7Hnx7sH2q/9P2TiPuGRB3vMO2sGZ/8NwK9A4TeR8MfOJLi1PhRA7bv6SpXhkuTEDXb58eN/UIdz6RWNekSv8MbMkwGgUW1iJ0jNoPJAYZOqjAlIXzzftHvrA05/wAqCGrjcJngGv3teYPGDYBL0+HUFMufqknCZG80Fn2Eya88QW2R0ecctHwrwAtcYPOaq+0DXLvMvdLrrLQ/zQc22Ioh3FTSvcGe/dUA9Ab5JbASWlq72dCecaUpNXfufw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6y8LA+WfKtPylGcyjGQoyiyLYOcjTujCSkJ5CUyzX/Y=;
 b=BYDtbPJqtVJLxRtDBrhLfNLKiuYcPTiTT8VuBYG1mSrQCCJ8WPR+HRpHVxqYFyXcnkYF3tX39H6BkSVeHCqes5WE1gbhIwsXOeNDgw3FEmbkLXdz+Yo03h+uIzfxfB4wYpKi6mBgVFMqADJ5vBFab+ImYlgPOVTcOd1Ds9Jvf6cdJ/AMguPcQ4Af5cv8fwzBsUP6BA//r7/0nB1DbOO731u2LRLro3TfUa1R7abLTB9t4pojRVuo8dQCL7EN3yqZKs6HgBGad/ejHQCh7Cmpzvj82QXzi97Te5AR3GrByQ5Swhyp0Y+lcWmzhaWRdIfdY0RQoOi3nb9O7Z4Czzhh3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6y8LA+WfKtPylGcyjGQoyiyLYOcjTujCSkJ5CUyzX/Y=;
 b=s9R5+4/nck5oX0UP8WIC2ICKFY4ddf/ItWGVtZlC6xN6LyAsnI73WuqvILsgSbdCM1MKDGqWUTOrwTFfx9FhpLwzt7VNjKkFpvKFpjwhAc/ErJsDMrIG5B0LZgvn0ONQiQobAzXNVayrvlG9D5C9Xkct/vgfYmCFszsjQ7gBNGc=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:95::7)
 by MWHPR1101MB2080.namprd11.prod.outlook.com (2603:10b6:301:56::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.13; Wed, 10 Nov
 2021 14:19:52 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ccb6:6f5a:9841:266d]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ccb6:6f5a:9841:266d%8]) with mapi id 15.20.4690.015; Wed, 10 Nov 2021
 14:19:51 +0000
From:   <Conor.Dooley@microchip.com>
To:     <geert@linux-m68k.org>
CC:     <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
        <robh+dt@kernel.org>, <jassisinghbrar@gmail.com>,
        <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
        <aou@eecs.berkeley.edu>, <a.zummo@towertech.it>,
        <alexandre.belloni@bootlin.com>, <broonie@kernel.org>,
        <gregkh@linuxfoundation.org>, <Lewis.Hanly@microchip.com>,
        <Daire.McNamara@microchip.com>, <atish.patra@wdc.com>,
        <Ivan.Griffin@microchip.com>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <linux-crypto@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
        <linux-spi@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <krzysztof.kozlowski@canonical.com>, <bin.meng@windriver.com>
Subject: Re: [PATCH 12/13] riscv: icicle-kit: update microchip icicle kit
 device tree
Thread-Topic: [PATCH 12/13] riscv: icicle-kit: update microchip icicle kit
 device tree
Thread-Index: AQHX1LJ2yk8h5UAHwUis11m3Urxauav66E+AgAHqiIA=
Date:   Wed, 10 Nov 2021 14:19:51 +0000
Message-ID: <0e379411-2469-8c78-1a3f-0645579a967c@microchip.com>
References: <20211108150554.4457-1-conor.dooley@microchip.com>
 <20211108150554.4457-13-conor.dooley@microchip.com>
 <CAMuHMdWEhJj0Cqt3sgGvgZe7JSFqBmTgtZRkom30NKqEW27NvQ@mail.gmail.com>
In-Reply-To: <CAMuHMdWEhJj0Cqt3sgGvgZe7JSFqBmTgtZRkom30NKqEW27NvQ@mail.gmail.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none
 header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 494d3a12-32f4-4d38-933e-08d9a45528db
x-ms-traffictypediagnostic: MWHPR1101MB2080:
x-microsoft-antispam-prvs: <MWHPR1101MB20809D546B811C04C01BE32D98939@MWHPR1101MB2080.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vuz+0XWdq6dO9zd+uCdkk9iQO+u+nSgmxs/R1iWzx+/VmBAQpg1beVFy+j/3dD/hzK1+omUgNZ4PJeF7IkDSkDcodO+YDgMkz7PEVSQ4JbfO/ZVILQmcM18EYi3brb0FPKLDvWIMcnq/Jxqq/goG5t3GaPFCI4m3BAZ/nJvo6PqSHcbNEpBXBF3X4Kf5qf3wCCXh55/Rp0e1KiMLunTSDzxzCsluE1X6fypk3UGg6jv2LxEWD9hhJdXIyrdAqFMRrzIgNtvgkqELxC0BmqBt6PU4l+TGIxBecCGLqLhHktfVxXZYsDIUsDkuYSod+/QXW+AhaIRcHOyRHbrrCfGryAAlk/YfQ1Ws7Nju9UMCdsLN0d5MwtWKVNewMZ7PYBYuTeUV0H3ivM9J+9cp+ay4QBoDOzFd2UnEZunF1vlDvPtDwghoKAVA46dW9O/Mi5Q/eKpAw9JJdRvTXL9P3BDBwNudejHhZlz9WduAUnz9jRG+4dMKgDrXzAbM2Xiwb9D2W3FAR5T9eDagxUAFUCwnFVjXo643jzHq9leriXkMgKwy5Y1LtC2zr2+Y4iOQ4kTYCJjbHSswnNPZK7HByNqwxaZWei7WHH58hfUBD4ZHT8bSqiobtKNVd4zLhQRVwuxNTdW93pd0hBG8Z+q4OpZKqWpMQ0B3v48WM9yTzfkjhZErySVVrAzsdGn2rVjGK9Q1EuWRg+EMyTjM2pwUVWD3B7n4if2ok+AS0CydAfOGVym1gFOnSVWyOklvZp4EmVgng+fwmvvKrKilRLhciZ4p3A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(86362001)(71200400001)(53546011)(508600001)(6512007)(66946007)(66446008)(64756008)(66556008)(31696002)(6506007)(26005)(38100700002)(66476007)(6486002)(122000001)(31686004)(2616005)(76116006)(38070700005)(91956017)(36756003)(7416002)(316002)(54906003)(5660300002)(4326008)(8676002)(30864003)(15650500001)(2906002)(8936002)(83380400001)(6916009)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YlllQXFkTm41dzBEaVpaeU5jWDJodVdFMFNmTzVjbTYwaGZyV25CT3pJUXpM?=
 =?utf-8?B?eGw3eUE1RXpDUnpDbmxqa0x2UDdhVVF4SXZDMnRqNi9PcjVpeHRVY2lkN2F0?=
 =?utf-8?B?aHl2bmpBdEdqRjV3VWpZaUlZZGhBMkRBLzN4MkMrMEV5ZGJSbjhmTE9uUnBv?=
 =?utf-8?B?eUMySEhzN3BvbUw1RExaQzVNUGV5N21BVGxMZ2VQclNzVUJkTjhoR3ErTEU1?=
 =?utf-8?B?YmhUTXRmWm9vRFNFVDdMVDN4c3F2RlRxYVphVlVKbGErTUJrLytlZ2VNZEox?=
 =?utf-8?B?bDRKTDhqbWROd1NwMEVYRGdyMFNrbWJ5WE8vNkFmZGF1ejkvVmVYdFlVYzBu?=
 =?utf-8?B?aTZCNzRyOFJFc0hZdUVSa3oxcDFOQVJ5eE9DTzA3SWVsMVFwWkNHbElQajhW?=
 =?utf-8?B?Y3c3dGFaY1d3NENuSlNrcHRSanZkWmVpdUVaRDZPdFhXZVFVdTNrZEJ1bENB?=
 =?utf-8?B?N2U1OWlzckRESkpLQnVuY2pqaWpzTVlDR25hZm9Gb0NwMVRYM2dxWjM4dE0w?=
 =?utf-8?B?aTBBYi9zV2JzVENzT09UQndyN0NReGUrcGNyeGhDMFFjTjNaK29QUmdidCsv?=
 =?utf-8?B?MUlkWWo0bWJyUTJwUkR5VDUvMjNlZVVvZFRqTit2SXpvalQ5MkU5VlpnZlhh?=
 =?utf-8?B?cFU0NmdyY3ArakpNQ2VZV1Q0K0p3cEFSendqa0doSFJ4by8rTEZybFQyWVdS?=
 =?utf-8?B?c3ZFM0dhU0pGb0pxcDN0VlE3UlhoUlpvaEs0QkdxS1BaUFFnQXVpZXE3bTZX?=
 =?utf-8?B?aXAxdWt6R2lEME9EeitGUUVZQU1qcEwralRTZDhBZXhhU1dSczNSV3dTcDVZ?=
 =?utf-8?B?WVVUdEZ4Qk0wYitKbGZMNm13Vi9aeVl4UmM5cEQ0N2ZyWCtDUEo5ZUJrdWxG?=
 =?utf-8?B?ZHRHeklWaGxFeFptRzZwVXJVcFdzUDNJSUNjUVlQa0ZlbXJVVGQwYlpFRGNn?=
 =?utf-8?B?d3NLWmhZb1NqbXliUG9hUDZnZzdqV0hlcU5KN1J4VXNHaXlKR3VDQ3prY0dY?=
 =?utf-8?B?M0ZmVmZ1L0VZd040ak94UFl5ek9FY0xBeGNDVUFFVk85WS9OblJnYzVhZVFG?=
 =?utf-8?B?Y05YVlI5SkZIZnlQZGVYY1BSRy84cUFxa0RZYm02RDBZTWlMREEvUHpCOTA4?=
 =?utf-8?B?R05zWEdWU0syNGlUTDE3TlBHRDZoejdrck9XUTI1NU9ZTlNJZEd5cVJvajQw?=
 =?utf-8?B?eGZlZzJKd3BKNmMrS3F5RktsRlZsbmo5NXMzVk1XWDFtdW5TeDVldzNqSFRr?=
 =?utf-8?B?MlJjZXI2TmlnV0dCYnVYSjdJTFVFTkhNM0FKcm40R00vWWhYdUZPREVwajk5?=
 =?utf-8?B?Vjg3bEtoZ3BjeDUxbDRkWHdKbnNjd1VkRnA4MUd2b1hMRmQxZ2NEbnJoNTVT?=
 =?utf-8?B?aFNPMjRuWDM2WjN6RmhrekNwVUl6T3UzRE1iZHYrQW1CbkRhUVlWNnpwaitx?=
 =?utf-8?B?cmYrZ2JKWkFmNzZMR3JzU3F1UGxmOXpGOWdmSHBVdmtHSWlaMTgva3Y4RGc3?=
 =?utf-8?B?cnFVMGtUOXV3bWdrYjF3YWVDK255eXlhT0xNTUkxV3ViVi9OZUZtdDFORURh?=
 =?utf-8?B?Wm1ZSVo2Z2VZdEdXMnZSZHZ1Q3RxWlZxRTd4SHlqTmJmZDFGeVFlY0JzaFc4?=
 =?utf-8?B?SUFqZ3pvV2NQQXFhMmplSnlwSktpT0djRDB2WmdyNHJLc3l4SXpjMGd1aWtQ?=
 =?utf-8?B?bnM2Y09zMG1SOGQ3NHk5NVJQOWtIbTdqWXVtYXQ1MVRvanhpVGlGSWJzT2sv?=
 =?utf-8?B?Q3pwK2JKZVIvMXJKOEdiR28wNEFhOEVkbUZyUE5XNHlQNFRtZUx1Zi9ybURN?=
 =?utf-8?B?MkdUdk5HQmRDVjVyT04rOW9DZTYvNERRdThCUXFsbUpDdHhvbnJ4b0NPNTZw?=
 =?utf-8?B?c1BWVER6ZERONUdaS3N5WUx3Qm5mQUZQdmVWNDdaT1JCdFlDMUtOMnlyRHFa?=
 =?utf-8?B?djd3K0d3cm9jT01MV1NzYkR6ZEx0UkdEckkrY2E4QkJUSW9KQWlzTTRnUkdF?=
 =?utf-8?B?Z0R2d1FKNmVVZG1OZzY2ZTlsY0dpbUdpQzgwSGtQc3RHaktPaU14U0V3emp5?=
 =?utf-8?B?UzFFR1pWUUVmUDlHcndrUzg0N05EZlV4ZFUrSmlrUEVQck5HM0R5NDg4SUpB?=
 =?utf-8?B?YTZKRjR5NkF5aURNeUxVaEtxSnZJakZTYWhaOHBLQzdwMjBxbmNLdHN6VFhI?=
 =?utf-8?B?RktWY295Ym1TVFRrYnFPQkF2RlFZT2tWV284TVpJNXZ6d2FXd3RFKzlJNk9t?=
 =?utf-8?B?VDA3UEdhMUhCa2lZZG5kMmpIVW1nPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <701928C4F68B2948B2E782C7989C4E68@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 494d3a12-32f4-4d38-933e-08d9a45528db
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2021 14:19:51.2766
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G4dDETY9Np96OEzUFwYEUrozn/WXvmJQ9aaaV9OsRslrk/YyAEHpSmP1Vx9kZvGnv1gepbf2SySkrrrO86AowPn+joMXYG2CZ0bfoX0edz8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2080
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

T24gMDkvMTEvMjAyMSAwOTowNCwgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3RlOg0KPiBFWFRFUk5B
TCBFTUFJTDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlv
dSBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUNCj4gDQo+IEhpIENvbm9yLA0KPiANCj4gT24gTW9u
LCBOb3YgOCwgMjAyMSBhdCA0OjA3IFBNIDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4gd3Jv
dGU6DQo+PiBGcm9tOiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPg0K
Pj4NCj4+IFVwZGF0ZSB0aGUgZGV2aWNlIHRyZWUgZm9yIHRoZSBpY2ljbGUga2l0IGJ5IHNwbGl0
dGluZyBpdCBpbnRvIGEgdGhpcmQgcGFydCwNCj4+IHdoaWNoIGNvbnRhaW5zIHBlcmlwaGVyYWxz
IGluIHRoZSBmcGdhIGZhYnJpYywgYWRkIG5ldyBwZXJpcGhlcmFscw0KPj4gKHNwaSwgcXNwaSwg
Z3BpbywgcnRjLCBwY2llLCBzeXN0ZW0gc2VydmljZXMsIGkyYyksIHVwZGF0ZSBwYXJ0cyBvZiB0
aGUgbWVtb3J5DQo+PiBtYXAgd2hpY2ggaGF2ZSBiZWVuIGNoYW5nZWQuDQo+Pg0KPj4gU2lnbmVk
LW9mZi1ieTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4NCj4gDQo+
IFRoYW5rcyBmb3IgeW91ciBwYXRjaCENCj4gDQo+IFBsZWFzZSBzcGxpdCBpdCBpbnRvIGxvZ2lj
YWwgc2VwYXJhdGVkIHBhcnRzLg0KeWVhaCwgaXZlIHNwbGl0IGl0IGludG8gc2V2ZXJhbCBwYXRj
aGVzIC0gb25lIGZvciB0aGUgc3BsaXR0aW5nIGludG8gMywgDQpvbmUgZm9yIHRoZSBuZXcgZGVm
aW5lcywgb25lIGZvciB0aGUgY2hhbmdlcyB0byBleGlzdGluZyBub2RlcyBhbmQgb25lIA0KZm9y
IG5vZGUgYWRkaXRpb25zLg0KDQo+IA0KPj4gLS0tIC9kZXYvbnVsbA0KPj4gKysrIGIvYXJjaC9y
aXNjdi9ib290L2R0cy9taWNyb2NoaXAvbWljcm9jaGlwLW1wZnMtZmFicmljLmR0c2kNCj4+IEBA
IC0wLDAgKzEsMjEgQEANCj4+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAg
T1IgTUlUKQ0KPj4gKy8qIENvcHlyaWdodCAoYykgMjAyMC0yMDIxIE1pY3JvY2hpcCBUZWNobm9s
b2d5IEluYyAqLw0KPj4gKw0KPj4gKy8gew0KPj4gKyAgICAgICBmcGdhZG1hOiBmcGdhZG1hQDYw
MDIwMDAwIHsNCj4+ICsgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gIm1pY3JvY2hpcCxtcGZz
LWZwZ2EtZG1hLXVpbyI7DQo+PiArICAgICAgICAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47
DQo+PiArICAgICAgICAgICAgICAgI3NpemUtY2VsbHMgPSA8MD47DQo+PiArICAgICAgICAgICAg
ICAgcmVnID0gPDB4MCAweDYwMDIwMDAwIDB4MCAweDEwMDA+Ow0KPj4gKyAgICAgICAgICAgICAg
IGludGVycnVwdC1wYXJlbnQgPSA8JnBsaWM+Ow0KPj4gKyAgICAgICAgICAgICAgIGludGVycnVw
dHMgPSA8UExJQ19JTlRfRkFCUklDX0YySF8yPjsNCj4+ICsgICAgICAgICAgICAgICBzdGF0dXMg
PSAib2theSI7DQo+PiArICAgICAgIH07DQo+PiArDQo+PiArICAgICAgIGZwZ2Fsc3JhbTogZnBn
YV9sc3JhbUA2MTAwMDAwMCB7DQo+PiArICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJnZW5l
cmljLXVpbyI7DQo+PiArICAgICAgICAgICAgICAgcmVnID0gPDB4MCAweDYxMDAwMDAwIDB4MCAw
eDAwMDEwMDANCj4+ICsgICAgICAgICAgICAgICAgICAgICAgIDB4MTQgMHgwMDAwMDAwMCAweDAg
MHgwMDAxMDAwMD47DQo+IA0KPiBQbGVhc2UgZ3JvdXAgYnkgYW5ndWxhciBicmFja2V0cywgdG8g
aW5jcmVhc2UgcmVhZGFiaWxpdHksIGFuZCBzdXBwb3J0DQo+IGF1dG9tYXRpYyB2YWxpZGF0aW9u
Og0KPiANCj4gPDB4MCAweDYxMDAwMDAwIDB4MCAweDAwMDEwMDA+LCA8MHgxNCAweDAwMDAwMDAw
IDB4MCAweDAwMDEwMDAwPg0KPiANCj4+ICsgICAgICAgICAgICAgICBzdGF0dXMgPSAib2theSI7
DQo+PiArICAgICAgIH07DQo+IA0KPiBEbyB3ZSByZWFsbHkgd2FudCBVSU8gbm9kZXMgaW4gdXBz
dHJlYW0gRFQ/DQpBcyBJIHNhaWQgaW4gdGhlIHJlcGxpZXMgdG8gYW5vdGhlciBwYXRjaCB0aGlz
IGlzIG15IGZpcnN0IHRpbWUgZG9pbmcgDQphbnkgdXBzdHJlYW1pbmcgb2YgYSBkZXZpY2UgdHJl
ZSwgaSBkaWRudCByZWFsaXNlIHRoYXQgdGhpcyB3b3VsZCBiZSBhIA0KcHJvYmxlbS4NCj4gDQo+
PiArfTsNCj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL21pY3JvY2hpcC9taWNy
b2NoaXAtbXBmcy1pY2ljbGUta2l0LmR0cyBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvbWljcm9jaGlw
L21pY3JvY2hpcC1tcGZzLWljaWNsZS1raXQuZHRzDQo+PiBpbmRleCBmYzFlNTg2OWRmMWIuLjQy
MTIxMjlmY2RmMSAxMDA2NDQNCj4+IC0tLSBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvbWljcm9jaGlw
L21pY3JvY2hpcC1tcGZzLWljaWNsZS1raXQuZHRzDQo+PiArKysgYi9hcmNoL3Jpc2N2L2Jvb3Qv
ZHRzL21pY3JvY2hpcC9taWNyb2NoaXAtbXBmcy1pY2ljbGUta2l0LmR0cw0KPj4gQEAgLTEsNSAr
MSw1IEBADQo+PiAgIC8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMCBPUiBNSVQp
DQo+PiAtLyogQ29weXJpZ2h0IChjKSAyMDIwIE1pY3JvY2hpcCBUZWNobm9sb2d5IEluYyAqLw0K
Pj4gKy8qIENvcHlyaWdodCAoYykgMjAyMC0yMDIxIE1pY3JvY2hpcCBUZWNobm9sb2d5IEluYyAq
Lw0KPj4NCj4+ICAgL2R0cy12MS87DQo+Pg0KPj4gQEAgLTEzLDcyICsxMywxODcgQEAgLyB7DQo+
PiAgICAgICAgICBjb21wYXRpYmxlID0gIm1pY3JvY2hpcCxtcGZzLWljaWNsZS1raXQiLCAibWlj
cm9jaGlwLG1wZnMiOw0KPj4NCj4+ICAgICAgICAgIGFsaWFzZXMgew0KPj4gLSAgICAgICAgICAg
ICAgIGV0aGVybmV0MCA9ICZlbWFjMTsNCj4+IC0gICAgICAgICAgICAgICBzZXJpYWwwID0gJnNl
cmlhbDA7DQo+PiAtICAgICAgICAgICAgICAgc2VyaWFsMSA9ICZzZXJpYWwxOw0KPj4gLSAgICAg
ICAgICAgICAgIHNlcmlhbDIgPSAmc2VyaWFsMjsNCj4+IC0gICAgICAgICAgICAgICBzZXJpYWwz
ID0gJnNlcmlhbDM7DQo+PiArICAgICAgICAgICAgICAgbW11YXJ0MCA9ICZtbXVhcnQwOw0KPj4g
KyAgICAgICAgICAgICAgIG1tdWFydDEgPSAmbW11YXJ0MTsNCj4+ICsgICAgICAgICAgICAgICBt
bXVhcnQyID0gJm1tdWFydDI7DQo+PiArICAgICAgICAgICAgICAgbW11YXJ0MyA9ICZtbXVhcnQz
Ow0KPj4gKyAgICAgICAgICAgICAgIG1tdWFydDQgPSAmbW11YXJ0NDsNCj4gDQo+IFdoeT8gU2Vy
aWFsTiBpcyB0aGUgc3RhbmRhcmQgYWxpYXMgbmFtZS4NCndlIGNoYW5nZWQgdGhlIGxhYmVsIHRv
IG1tdWFydCB0byBtYXRjaCB0aGUgbWljcm9jaGlwIGRvY3VtZW50YXRpb24uIA0Kd291bGQgaXQg
bWFrZSBtb3JlIHNlbnNlIHRvIGNhbGwgbW11YXJ0IGJ1dCBhbGlhcyBpdCB0byBzZXJpYWw/DQpp
ZSBzZXJpYWwwID0gJm1tdWFydDA7DQo+IA0KPj4gICAgICAgICAgfTsNCj4gDQo+Pg0KPj4gLSZl
bWFjMCB7DQo+PiArJnNwaTAgew0KPj4gKyAgICAgICBzdGF0dXMgPSAib2theSI7DQo+PiArICAg
ICAgIHNwaWRldkAwIHsNCj4+ICsgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gInNwaWRldiI7
DQo+IA0KPiBQbGVhc2UgZG9uJ3QgdXNlICJzcGlkZXYiLCBidXQgYSBwcm9wZXIgY29tcGF0aWJs
ZSB2YWx1ZSBkZXNjcmliaW5nDQo+IHdoYXQgaXMgcmVhbGx5IGNvbm5lY3RlZC4gIElmIHlvdSB3
YW50IHRvIHVzZSBpdCB3aXRoIHNwaWRldiAod2hpY2gNCj4gaXMgc29mdHdhcmUgcG9saWN5LCBu
b3QgaGFyZHdhcmUgZGVzY3JpcHRpb24pLCBhZGQgdGhhdCBjb21wYXRpYmxlDQo+IHZhbHVlIHRv
IGRyaXZlcnMvc3BpL3NwaWRldi5jOnNwaWRldl9kdF9pZHNbXSwgb3IgdXNlIGRyaXZlcl9vdmVy
cmlkZQ0KPiBpbiBzeXNmcyBhdCBydW50aW1lLg0KYXMgaSBzYWlkIHRvIEtyenlzenRvZiAtIHRo
aXMgb25lIHdhcyBhbiBvdmVyc2lnaHQgZnJvbSBtZSwgdGhhdCANCmNvbXBhdGlibGUgaGFzIG5l
dmVyIGJlZW4gInNwaWRldiIgIG9uIGl0cyBvd24gaW4gb3VyIGludGVybmFsIHRyZWUgYW5kIA0K
aSBtdXN0dmUgYWNjaWRlbnRhbGx5IG9taXR0ZWQgdGhlIHZlbmRvciBzdHJpbmcgd2hpbGUgbWFr
aW5nIHRoZXNlIHBhdGNoZXMuDQoNCkVpdGhlciB3YXksIGFmdGVyIHRhbGtpbmcgc29tZSBtb3Jl
IHdlIGRlY2lkZWQgdGhhdCB0aGlzIGVudHJ5IGlzIG5vdCANCmFwcHJvcHJpYXRlIGFueXdheSBh
bmQgaSB3aWxsIGRyb3AgaXQuDQo+IA0KPj4gKyAgICAgICAgICAgICAgIHJlZyA9IDwwPjsgLyog
Q1MgMCAqLw0KPj4gKyAgICAgICAgICAgICAgIHNwaS1tYXgtZnJlcXVlbmN5ID0gPDEwMDAwMDAw
PjsNCj4+ICsgICAgICAgICAgICAgICBzdGF0dXMgPSAib2theSI7DQo+PiArICAgICAgIH07DQo+
PiArfTsNCj4+ICsNCj4+ICsmc3BpMSB7DQo+PiArICAgICAgIHN0YXR1cyA9ICJva2F5IjsNCj4g
DQo+IE5vIHNsYXZlIGRldmljZXMgc3BlY2lmaWVkPw0Kbm8sIGJ1dCBpdHMgZXhwb3NlZA0KPiAN
Cj4+ICt9Ow0KPj4gKw0KPj4gKyZxc3BpIHsNCj4+ICsgICAgICAgc3RhdHVzID0gIm9rYXkiOw0K
Pj4gK307DQo+PiArDQo+PiArJmkyYzAgew0KPj4gKyAgICAgICBzdGF0dXMgPSAib2theSI7DQo+
PiArfTsNCj4+ICsNCj4+ICsmaTJjMSB7DQo+PiArICAgICAgIHN0YXR1cyA9ICJva2F5IjsNCj4+
ICsgICAgICAgcGFjMTkzeDogcGFjMTkzeEAxMCB7DQo+IA0KPiBhZGNALCBJIGd1ZXNzPw0Kc3Vy
ZQ0KPiANCj4+ICsgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gIm1pY3JvY2hpcCxwYWMxOTM0
IjsNCj4+ICsgICAgICAgICAgICAgICByZWcgPSA8MHgxMD47DQo+PiArICAgICAgICAgICAgICAg
c2FtcC1yYXRlID0gPDY0PjsNCj4+ICsgICAgICAgICAgICAgICBzdGF0dXMgPSAib2theSI7DQo+
PiArICAgICAgICAgICAgICAgY2gwOiBjaGFubmVsMCB7DQo+PiArICAgICAgICAgICAgICAgICAg
ICAgICB1b2htcy1zaHVudC1yZXMgPSA8MTAwMDA+Ow0KPj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgcmFpbC1uYW1lID0gIlZERFJFRyI7DQo+PiArICAgICAgICAgICAgICAgICAgICAgICBjaGFu
bmVsX2VuYWJsZWQ7DQo+PiArICAgICAgICAgICAgICAgfTsNCj4+ICsgICAgICAgICAgICAgICBj
aDE6IGNoYW5uZWwxIHsNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgIHVvaG1zLXNodW50LXJl
cyA9IDwxMDAwMD47DQo+PiArICAgICAgICAgICAgICAgICAgICAgICByYWlsLW5hbWUgPSAiVkRE
QTI1IjsNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgIGNoYW5uZWxfZW5hYmxlZDsNCj4+ICsg
ICAgICAgICAgICAgICB9Ow0KPj4gKyAgICAgICAgICAgICAgIGNoMjogY2hhbm5lbDIgew0KPj4g
KyAgICAgICAgICAgICAgICAgICAgICAgdW9obXMtc2h1bnQtcmVzID0gPDEwMDAwPjsNCj4+ICsg
ICAgICAgICAgICAgICAgICAgICAgIHJhaWwtbmFtZSA9ICJWREQyNSI7DQo+PiArICAgICAgICAg
ICAgICAgICAgICAgICBjaGFubmVsX2VuYWJsZWQ7DQo+PiArICAgICAgICAgICAgICAgfTsNCj4+
ICsgICAgICAgICAgICAgICBjaDM6IGNoYW5uZWwzIHsNCj4+ICsgICAgICAgICAgICAgICAgICAg
ICAgIHVvaG1zLXNodW50LXJlcyA9IDwxMDAwMD47DQo+PiArICAgICAgICAgICAgICAgICAgICAg
ICByYWlsLW5hbWUgPSAiVkREQV9SRUciOw0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgY2hh
bm5lbF9lbmFibGVkOw0KPj4gKyAgICAgICAgICAgICAgIH07DQo+PiArICAgICAgIH07DQo+PiAr
fTsNCj4gDQo+PiArJmdwaW8yIHsNCj4+ICsgICAgICAgaW50ZXJydXB0cyA9IDxQTElDX0lOVF9H
UElPMl9OT05fRElSRUNUDQo+PiArICAgICAgICAgICAgICAgUExJQ19JTlRfR1BJTzJfTk9OX0RJ
UkVDVA0KPj4gKyAgICAgICAgICAgICAgIFBMSUNfSU5UX0dQSU8yX05PTl9ESVJFQ1QNCj4+ICsg
ICAgICAgICAgICAgICBQTElDX0lOVF9HUElPMl9OT05fRElSRUNUDQo+PiArICAgICAgICAgICAg
ICAgUExJQ19JTlRfR1BJTzJfTk9OX0RJUkVDVA0KPj4gKyAgICAgICAgICAgICAgIFBMSUNfSU5U
X0dQSU8yX05PTl9ESVJFQ1QNCj4+ICsgICAgICAgICAgICAgICBQTElDX0lOVF9HUElPMl9OT05f
RElSRUNUDQo+PiArICAgICAgICAgICAgICAgUExJQ19JTlRfR1BJTzJfTk9OX0RJUkVDVA0KPj4g
KyAgICAgICAgICAgICAgIFBMSUNfSU5UX0dQSU8yX05PTl9ESVJFQ1QNCj4+ICsgICAgICAgICAg
ICAgICBQTElDX0lOVF9HUElPMl9OT05fRElSRUNUDQo+PiArICAgICAgICAgICAgICAgUExJQ19J
TlRfR1BJTzJfTk9OX0RJUkVDVA0KPj4gKyAgICAgICAgICAgICAgIFBMSUNfSU5UX0dQSU8yX05P
Tl9ESVJFQ1QNCj4+ICsgICAgICAgICAgICAgICBQTElDX0lOVF9HUElPMl9OT05fRElSRUNUDQo+
PiArICAgICAgICAgICAgICAgUExJQ19JTlRfR1BJTzJfTk9OX0RJUkVDVA0KPj4gKyAgICAgICAg
ICAgICAgIFBMSUNfSU5UX0dQSU8yX05PTl9ESVJFQ1QNCj4+ICsgICAgICAgICAgICAgICBQTElD
X0lOVF9HUElPMl9OT05fRElSRUNUDQo+PiArICAgICAgICAgICAgICAgUExJQ19JTlRfR1BJTzJf
Tk9OX0RJUkVDVA0KPj4gKyAgICAgICAgICAgICAgIFBMSUNfSU5UX0dQSU8yX05PTl9ESVJFQ1QN
Cj4+ICsgICAgICAgICAgICAgICBQTElDX0lOVF9HUElPMl9OT05fRElSRUNUDQo+PiArICAgICAg
ICAgICAgICAgUExJQ19JTlRfR1BJTzJfTk9OX0RJUkVDVA0KPj4gKyAgICAgICAgICAgICAgIFBM
SUNfSU5UX0dQSU8yX05PTl9ESVJFQ1QNCj4+ICsgICAgICAgICAgICAgICBQTElDX0lOVF9HUElP
Ml9OT05fRElSRUNUDQo+PiArICAgICAgICAgICAgICAgUExJQ19JTlRfR1BJTzJfTk9OX0RJUkVD
VA0KPj4gKyAgICAgICAgICAgICAgIFBMSUNfSU5UX0dQSU8yX05PTl9ESVJFQ1QNCj4+ICsgICAg
ICAgICAgICAgICBQTElDX0lOVF9HUElPMl9OT05fRElSRUNUDQo+PiArICAgICAgICAgICAgICAg
UExJQ19JTlRfR1BJTzJfTk9OX0RJUkVDVA0KPj4gKyAgICAgICAgICAgICAgIFBMSUNfSU5UX0dQ
SU8yX05PTl9ESVJFQ1QNCj4+ICsgICAgICAgICAgICAgICBQTElDX0lOVF9HUElPMl9OT05fRElS
RUNUDQo+PiArICAgICAgICAgICAgICAgUExJQ19JTlRfR1BJTzJfTk9OX0RJUkVDVA0KPj4gKyAg
ICAgICAgICAgICAgIFBMSUNfSU5UX0dQSU8yX05PTl9ESVJFQ1QNCj4+ICsgICAgICAgICAgICAg
ICBQTElDX0lOVF9HUElPMl9OT05fRElSRUNUDQo+PiArICAgICAgICAgICAgICAgUExJQ19JTlRf
R1BJTzJfTk9OX0RJUkVDVD47DQo+IA0KPiBXaHkgb3ZlcnJpZGUgaW50ZXJydXB0cyBpbiB0aGUg
Ym9hcmQgLmR0cyBmaWxlPw0KPiBEb2Vzbid0IHRoaXMgYmVsb25nIGluIHRoZSBTb0MgLmR0c2kg
ZmlsZT8NClRoZSBpbnRlcnJ1cHQgc2V0dXAgZm9yIHRoZSBncGlvIGlzbnQgZml4ZWQsIHRoZXJl
IGlzIGFuIG9wdGlvbiB0byANCmVpdGhlciBjb25uZWN0IHRoZSBpbmRpdmlkdWFsIGdwaW8gaW50
ZXJydXB0cyB0byB0aGUgcGxpYyAqb3IqIHRoZXkgY2FuIA0KYmUgY29ubmVjdGVkIHRvIGEgcGVy
IGdwaW8gY29udHJvbGxlciBjb21tb24gaW50ZXJydXB0LCBhbmQgaXQgaXMgdXAgdG8gDQp0aGUg
ZHJpdmVyIHRvIHJlYWQgYSByZWdpc3RlciB0byBkZXRlcm1pbmUgd2hpY2ggaW50ZXJydXB0IHRy
aWdnZXJlZCB0aGUgDQpjb21tb24vTk9OX0RJUkVDVCBpbnRlcnJ1cHQuIFRoaXMgZGVjaXNpb24g
aXMgbWFkZSBieSBhIHdyaXRlIHRvIGEgDQpzeXN0ZW0gcmVnaXN0ZXIgaW4gYXBwbGljYXRpb24g
Y29kZSwgd2hpY2ggdG8gdXMgZGlkbid0IHNlZW0gbGlrZSBpdCANCmJlbG9uZ2VkIGluIHRoZSBz
b2MgLmR0c2kuDQoNClVzaW5nIHRoZSBjb21tb24gaW50ZXJydXB0IGZvciBHUElPMiBpcyB0aGUg
ZGVmYXVsdCBvbiB0aGUgDQpwb2xhcmZpcmUtc29jLCB0aGVyZSBhcmUgb25seSAzOCBwZXIgZ3Bp
byBsaW5lIGludGVycnVwdHMgYXZhaWxhYmxlIG9mIA0Kd2hpY2ggMTQgYXJlIGNvbm5lY3RlZCB0
byBncGlvMCBhbmQgMjQgdG8gZ3BpbzEuDQoNCj4gUGxlYXNlIGdyb3VwIHVzaW5nIGFuZ3VsYXIg
YnJhY2tldHMuDQo+IA0KPj4gLS0tIGEvYXJjaC9yaXNjdi9ib290L2R0cy9taWNyb2NoaXAvbWlj
cm9jaGlwLW1wZnMuZHRzaQ0KPj4gKysrIGIvYXJjaC9yaXNjdi9ib290L2R0cy9taWNyb2NoaXAv
bWljcm9jaGlwLW1wZnMuZHRzaQ0KPiANCj4+IEBAIC0xNDUsNDkgKzE0OSw1NSBAQCBjcHU0X2lu
dGM6IGludGVycnVwdC1jb250cm9sbGVyIHsNCj4+ICAgICAgICAgIHNvYyB7DQo+PiAgICAgICAg
ICAgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDI+Ow0KPj4gICAgICAgICAgICAgICAgICAjc2l6
ZS1jZWxscyA9IDwyPjsNCj4+IC0gICAgICAgICAgICAgICBjb21wYXRpYmxlID0gInNpbXBsZS1i
dXMiOw0KPj4gKyAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAibWljcm9jaGlwLG1wZnMtc29j
IiwgInNpbXBsZS1idXMiOw0KPj4gICAgICAgICAgICAgICAgICByYW5nZXM7DQo+Pg0KPj4gLSAg
ICAgICAgICAgICAgIGNhY2hlLWNvbnRyb2xsZXJAMjAxMDAwMCB7DQo+PiArICAgICAgICAgICAg
ICAgY2N0cmxscjogY2FjaGUtY29udHJvbGxlckAyMDEwMDAwIHsNCj4+ICAgICAgICAgICAgICAg
ICAgICAgICAgICBjb21wYXRpYmxlID0gInNpZml2ZSxmdTU0MC1jMDAwLWNjYWNoZSIsICJjYWNo
ZSI7DQo+PiArICAgICAgICAgICAgICAgICAgICAgICByZWcgPSA8MHgwIDB4MjAxMDAwMCAweDAg
MHgxMDAwPjsNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgIGludGVycnVwdC1wYXJlbnQgPSA8
JnBsaWM+Ow0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgaW50ZXJydXB0cyA9IDxQTElDX0lO
VF9MMl9NRVRBREFUQV9DT1JSDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFBM
SUNfSU5UX0wyX01FVEFEQVRfVU5DT1JSDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIFBMSUNfSU5UX0wyX0RBVEFfQ09SUj47DQo+IA0KPiBQbGVhc2UgZ3JvdXAgdXNpbmcgYW5n
dWxhciBicmFja2V0cy4NCj4gDQo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgY2FjaGUtYmxv
Y2stc2l6ZSA9IDw2ND47DQo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgY2FjaGUtbGV2ZWwg
PSA8Mj47DQo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgY2FjaGUtc2V0cyA9IDwxMDI0PjsN
Cj4+ICAgICAgICAgICAgICAgICAgICAgICAgICBjYWNoZS1zaXplID0gPDIwOTcxNTI+Ow0KPj4g
ICAgICAgICAgICAgICAgICAgICAgICAgIGNhY2hlLXVuaWZpZWQ7DQo+PiAtICAgICAgICAgICAg
ICAgICAgICAgICBpbnRlcnJ1cHQtcGFyZW50ID0gPCZwbGljPjsNCj4+IC0gICAgICAgICAgICAg
ICAgICAgICAgIGludGVycnVwdHMgPSA8MSAyIDM+Ow0KPj4gLSAgICAgICAgICAgICAgICAgICAg
ICAgcmVnID0gPDB4MCAweDIwMTAwMDAgMHgwIDB4MTAwMD47DQo+PiAgICAgICAgICAgICAgICAg
IH07DQo+Pg0KPj4gLSAgICAgICAgICAgICAgIGNsaW50QDIwMDAwMDAgew0KPj4gKyAgICAgICAg
ICAgICAgIGNsaW50OiBjbGludEAyMDAwMDAwIHsNCj4+ICAgICAgICAgICAgICAgICAgICAgICAg
ICBjb21wYXRpYmxlID0gInNpZml2ZSxmdTU0MC1jMDAwLWNsaW50IiwgInNpZml2ZSxjbGludDAi
Ow0KPj4gICAgICAgICAgICAgICAgICAgICAgICAgIHJlZyA9IDwweDAgMHgyMDAwMDAwIDB4MCAw
eEMwMDA+Ow0KPj4gLSAgICAgICAgICAgICAgICAgICAgICAgaW50ZXJydXB0cy1leHRlbmRlZCA9
IDwmY3B1MF9pbnRjIDMgJmNwdTBfaW50YyA3DQo+PiAtICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAmY3B1MV9pbnRjIDMgJmNwdTFfaW50YyA3DQo+PiAtICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmY3B1Ml9pbnRjIDMg
JmNwdTJfaW50YyA3DQo+PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAmY3B1M19pbnRjIDMgJmNwdTNfaW50YyA3DQo+PiAtICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmY3B1NF9pbnRjIDMgJmNwdTRfaW50YyA3PjsN
Cj4+ICsgICAgICAgICAgICAgICAgICAgICAgIGludGVycnVwdHMtZXh0ZW5kZWQgPQ0KPj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwmY3B1MF9pbnRjIEhBUlRfSU5U
X01fU09GVCAmY3B1MF9pbnRjIEhBUlRfSU5UX01fVElNRVINCj4+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgJmNwdTFfaW50YyBIQVJUX0lOVF9NX1NPRlQgJmNwdTFf
aW50YyBIQVJUX0lOVF9NX1RJTUVSDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICZjcHUyX2ludGMgSEFSVF9JTlRfTV9TT0ZUICZjcHUyX2ludGMgSEFSVF9JTlRf
TV9USU1FUg0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmY3B1
M19pbnRjIEhBUlRfSU5UX01fU09GVCAmY3B1M19pbnRjIEhBUlRfSU5UX01fVElNRVINCj4+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJmNwdTRfaW50YyBIQVJUX0lO
VF9NX1NPRlQgJmNwdTRfaW50YyBIQVJUX0lOVF9NX1RJTUVSPjsNCj4gDQo+IFBsZWFzZSBncm91
cCB1c2luZyBhbmd1bGFyIGJyYWNrZXRzLg0KPiANCj4+ICAgICAgICAgICAgICAgICAgfTsNCj4+
DQo+PiAgICAgICAgICAgICAgICAgIHBsaWM6IGludGVycnVwdC1jb250cm9sbGVyQGMwMDAwMDAg
ew0KPj4gLSAgICAgICAgICAgICAgICAgICAgICAgI2ludGVycnVwdC1jZWxscyA9IDwxPjsNCj4+
IC0gICAgICAgICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAic2lmaXZlLGZ1NTQwLWMwMDAt
cGxpYyIsICJzaWZpdmUscGxpYy0xLjAuMCI7DQo+PiArICAgICAgICAgICAgICAgICAgICAgICBj
b21wYXRpYmxlID0gInNpZml2ZSxwbGljLTEuMC4wIjsNCj4gDQo+IFdoeSBkcm9wIHRoZSBmaXJz
dCBvbmUgYWdhaW4/DQp3ZSBmZWx0IGl0IGRpZG50IG1ha2Ugc2Vuc2UgdG8gaGF2ZSBzb21ldGhp
bmcgdGhhdCBzcGVjaWZpY2FsbHkgDQpyZWZlcmVuY2VzIHRoZSBmdTU0MCBpbiB0aGUgZGV2aWNl
IHRyZWUgZm9yIHRoaXMgYm9hcmQuDQo+IA0KPj4gICAgICAgICAgICAgICAgICAgICAgICAgIHJl
ZyA9IDwweDAgMHhjMDAwMDAwIDB4MCAweDQwMDAwMDA+Ow0KPj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgI2ludGVycnVwdC1jZWxscyA9IDwxPjsNCj4+ICAgICAgICAgICAgICAgICAgICAgICAg
ICByaXNjdixuZGV2ID0gPDE4Nj47DQo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgaW50ZXJy
dXB0LWNvbnRyb2xsZXI7DQo+PiAtICAgICAgICAgICAgICAgICAgICAgICBpbnRlcnJ1cHRzLWV4
dGVuZGVkID0gPCZjcHUwX2ludGMgMTENCj4+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAmY3B1MV9pbnRjIDExICZjcHUxX2ludGMgOQ0KPj4gLSAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICZjcHUyX2ludGMgMTEgJmNwdTJfaW50YyA5DQo+PiAt
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJmNwdTNfaW50YyAxMSAmY3B1
M19pbnRjIDkNCj4+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmY3B1
NF9pbnRjIDExICZjcHU0X2ludGMgOT47DQo+PiArICAgICAgICAgICAgICAgICAgICAgICBpbnRl
cnJ1cHRzLWV4dGVuZGVkID0gPCZjcHUwX2ludGMgSEFSVF9JTlRfTV9FWFQNCj4+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmY3B1MV9pbnRjIEhBUlRfSU5UX01fRVhU
ICZjcHUxX2ludGMgSEFSVF9JTlRfU19FWFQNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAmY3B1Ml9pbnRjIEhBUlRfSU5UX01fRVhUICZjcHUyX2ludGMgSEFSVF9J
TlRfU19FWFQNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmY3B1
M19pbnRjIEhBUlRfSU5UX01fRVhUICZjcHUzX2ludGMgSEFSVF9JTlRfU19FWFQNCj4+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmY3B1NF9pbnRjIEhBUlRfSU5UX01f
RVhUICZjcHU0X2ludGMgSEFSVF9JTlRfU19FWFQ+Ow0KPj4gICAgICAgICAgICAgICAgICB9Ow0K
Pj4NCj4+IC0gICAgICAgICAgICAgICBkbWFAMzAwMDAwMCB7DQo+PiAtICAgICAgICAgICAgICAg
ICAgICAgICBjb21wYXRpYmxlID0gInNpZml2ZSxmdTU0MC1jMDAwLXBkbWEiOw0KPj4gKyAgICAg
ICAgICAgICAgIHBkbWE6IHBkbWFAMzAwMDAwMCB7DQo+PiArICAgICAgICAgICAgICAgICAgICAg
ICBjb21wYXRpYmxlID0gIm1pY3JvY2hpcCxtcGZzLXBkbWEtdWlvIjsNCj4+ICAgICAgICAgICAg
ICAgICAgICAgICAgICByZWcgPSA8MHgwIDB4MzAwMDAwMCAweDAgMHg4MDAwPjsNCj4+ICAgICAg
ICAgICAgICAgICAgICAgICAgICBpbnRlcnJ1cHQtcGFyZW50ID0gPCZwbGljPjsNCj4+IC0gICAg
ICAgICAgICAgICAgICAgICAgIGludGVycnVwdHMgPSA8MjMgMjQgMjUgMjYgMjcgMjggMjkgMzA+
Ow0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgaW50ZXJydXB0cyA9IDxQTElDX0lOVF9ETUFf
Q0gwX0RPTkUgUExJQ19JTlRfRE1BX0NIMF9FUlINCj4+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgUExJQ19JTlRfRE1BX0NIMV9ET05FIFBMSUNfSU5UX0RNQV9DSDFfRVJSDQo+PiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFBMSUNfSU5UX0RNQV9DSDJfRE9ORSBQTElD
X0lOVF9ETUFfQ0gyX0VSUg0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBQTElD
X0lOVF9ETUFfQ0gzX0RPTkUgUExJQ19JTlRfRE1BX0NIM19FUlI+Ow0KPiANCj4gUGxlYXNlIGdy
b3VwIHVzaW5nIGFuZ3VsYXIgYnJhY2tldHMuDQo+IA0KPj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICNkbWEtY2VsbHMgPSA8MT47DQo+PiAgICAgICAgICAgICAgICAgIH07DQo+Pg0KPj4gQEAg
LTIwNSw3ICsyMTUsNyBAQCBjbGtjZmc6IGNsa2NmZ0AyMDAwMjAwMCB7DQo+PiAgICAgICAgICAg
ICAgICAgICAgICAgICAgY2xvY2tzID0gPCZyZWZjbGs+Ow0KPj4gICAgICAgICAgICAgICAgICAg
ICAgICAgICNjbG9jay1jZWxscyA9IDwxPjsNCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICBj
bG9jay1vdXRwdXQtbmFtZXMgPSAiY3B1IiwgImF4aSIsICJhaGIiLCAiZW52bSIsICAgICAgIC8q
IDAtMyAgICovDQo+PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAibWFjMCIsICJt
YWMxIiwgIm1tYyIsICJ0aW1lciIsICAgICAgICAgICAgICAgIC8qIDQtNyAgICovDQo+PiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICJtYWMwIiwgIm1hYzEiLCAibW1jIiwgInRpbWVy
IiwgICAgICAgICAgICAgICAgIC8qIDQtNyAgICovDQo+PiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAibW11YXJ0MCIsICJtbXVhcnQxIiwgIm1tdWFydDIiLCAibW11YXJ0MyIsICAg
ICAvKiA4LTExICAqLw0KPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIm1tdWFy
dDQiLCAic3BpMCIsICJzcGkxIiwgImkyYzAiLCAgICAgICAgICAgICAgLyogMTItMTUgKi8NCj4+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJpMmMxIiwgImNhbjAiLCAiY2FuMSIs
ICJ1c2IiLCAgICAgICAgICAgICAgICAgIC8qIDE2LTE5ICovDQo+IA0KPiBObyBuZWVkIGZvciBj
bG9jay1vdXRwdXQtbmFtZXMgYXQgYWxsLg0KPiANCj4+DQo+PiAtICAgICAgICAgICAgICAgZW1h
YzE6IGV0aGVybmV0QDIwMTEyMDAwIHsNCj4+ICsgICAgICAgICAgICAgICBtYWMwOiBldGhlcm5l
dEAyMDExMDAwMCB7DQo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJj
ZG5zLG1hY2IiOw0KPj4gLSAgICAgICAgICAgICAgICAgICAgICAgcmVnID0gPDB4MCAweDIwMTEy
MDAwIDB4MCAweDIwMDA+Ow0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgI2FkZHJlc3MtY2Vs
bHMgPSA8MT47DQo+PiArICAgICAgICAgICAgICAgICAgICAgICAjc2l6ZS1jZWxscyA9IDwwPjsN
Cj4+ICsgICAgICAgICAgICAgICAgICAgICAgIHJlZyA9IDwweDAgMHgyMDExMDAwMCAweDAgMHgy
MDAwPjsNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgIGNsb2NrcyA9IDwmY2xrY2ZnIENMS19N
QUMwPiwgPCZjbGtjZmcgQ0xLX0FIQj47DQo+PiArICAgICAgICAgICAgICAgICAgICAgICBjbG9j
ay1uYW1lcyA9ICJwY2xrIiwgImhjbGsiOw0KPj4gICAgICAgICAgICAgICAgICAgICAgICAgIGlu
dGVycnVwdC1wYXJlbnQgPSA8JnBsaWM+Ow0KPj4gLSAgICAgICAgICAgICAgICAgICAgICAgaW50
ZXJydXB0cyA9IDw3MCA3MSA3MiA3Mz47DQo+PiAtICAgICAgICAgICAgICAgICAgICAgICBsb2Nh
bC1tYWMtYWRkcmVzcyA9IFswMCAwMCAwMCAwMCAwMCAwMF07DQo+PiAtICAgICAgICAgICAgICAg
ICAgICAgICBjbG9ja3MgPSA8JmNsa2NmZyA1PiwgPCZjbGtjZmcgMj47DQo+PiArICAgICAgICAg
ICAgICAgICAgICAgICBpbnRlcnJ1cHRzID0gPFBMSUNfSU5UX01BQzBfSU5UDQo+PiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIFBMSUNfSU5UX01BQzBfUVVFVUUxDQo+PiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIFBMSUNfSU5UX01BQzBfUVVFVUUyDQo+PiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIFBMSUNfSU5UX01BQzBfUVVFVUUzDQo+PiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIFBMSUNfSU5UX01BQzBfRU1BQw0KPj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBQTElDX0lOVF9NQUMwX01NU0w+Ow0KPiANCj4gUGxlYXNl
IGdyb3VwIHVzaW5nIGFuZ3VsYXIgYnJhY2tldHMuDQo+IA0KPj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgbWFjLWFkZHJlc3MgPSBbNTYgMzQgMTIgMDAgRkMgMDFdOw0KPiANCj4gUGxlYXNlIGRy
b3AgdGhpcy4NCklzIHRoZSBwcm9ibGVtIGhlcmUgaGF2aW5nIG1hYy1hZGRyZXNzIGluc3RlYWQg
b2YgbG9jYWwtLCBoYXZpbmcgZWl0aGVyIA0KYXQgYWxsIG9yIHRoYXQgd2UgaGF2ZSBwb3B1bGF0
ZWQgaXQgcmF0aGVyIHRoYW4ganVzdCBmaWxsaW5nIHdpdGggMHM/DQpXZSBzZXQgaXQgaW4gdS1i
b290IGFueXdheSwgc28gSSB0aGluayBkcm9wcGluZyBlbnRpcmVseSBpcyBva2F5Lg0KPiANCj4+
ICAgICAgICAgICAgICAgICAgICAgICAgICBzdGF0dXMgPSAiZGlzYWJsZWQiOw0KPj4gKyAgICAg
ICAgICAgICAgIH07DQo+Pg0KPj4gKyAgICAgICAgICAgICAgIHJ0YzogcnRjQDIwMTI0MDAwIHsN
Cj4+ICsgICAgICAgICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAibWljcm9jaGlwLG1wZnMt
cnRjIjsNCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwxPjsN
Cj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAjc2l6ZS1jZWxscyA9IDwwPjsNCj4+ICsgICAg
ICAgICAgICAgICAgICAgICAgIHJlZyA9IDwweDAgMHgyMDEyNDAwMCAweDAgMHgxMDAwPjsNCj4+
ICsgICAgICAgICAgICAgICAgICAgICAgIGNsb2NrcyA9IDwmY2xrY2ZnIENMS19SVEM+Ow0KPj4g
KyAgICAgICAgICAgICAgICAgICAgICAgY2xvY2stbmFtZXMgPSAicnRjIjsNCj4+ICsgICAgICAg
ICAgICAgICAgICAgICAgIGludGVycnVwdC1wYXJlbnQgPSA8JnBsaWM+Ow0KPj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgaW50ZXJydXB0cyA9IDxQTElDX0lOVF9SVENfV0FLRVVQIFBMSUNfSU5U
X1JUQ19NQVRDSD47DQo+IA0KPiBQbGVhc2UgZ3JvdXAgdXNpbmcgYW5ndWxhciBicmFja2V0cy4N
Cj4gDQo+PiArICAgICAgICAgICAgICAgICAgICAgICBzdGF0dXMgPSAiZGlzYWJsZWQiOw0KPj4g
ICAgICAgICAgICAgICAgICB9Ow0KPj4NCj4+ICsgICAgICAgICAgICAgICB1c2I6IHVzYkAyMDIw
MTAwMCB7DQo+PiArICAgICAgICAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gIm1pY3JvY2hp
cCxtcGZzLXVzYi1ob3N0IjsNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgIHJlZyA9IDwweDAg
MHgyMDIwMTAwMCAweDAgMHgxMDAwPjsNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgIHJlZy1u
YW1lcyA9ICJtYyIsImNvbnRyb2wiOw0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgY2xvY2tz
ID0gPCZjbGtjZmcgQ0xLX1VTQj47DQo+PiArICAgICAgICAgICAgICAgICAgICAgICBpbnRlcnJ1
cHQtcGFyZW50ID0gPCZwbGljPjsNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgIGludGVycnVw
dHMgPSA8UExJQ19JTlRfVVNCX0RNQSBQTElDX0lOVF9VU0JfTUM+Ow0KPiANCj4gUGxlYXNlIGdy
b3VwIHVzaW5nIGFuZ3VsYXIgYnJhY2tldHMuDQo+IA0KPj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgaW50ZXJydXB0LW5hbWVzID0gImRtYSIsIm1jIjsNCj4+ICsgICAgICAgICAgICAgICAgICAg
ICAgIGRyX21vZGUgPSAiaG9zdCI7DQo+PiArICAgICAgICAgICAgICAgICAgICAgICBzdGF0dXMg
PSAiZGlzYWJsZWQiOw0KPj4gKyAgICAgICAgICAgICAgIH07DQo+PiArDQo+IA0KPiBHcntvZXRq
ZSxlZXRpbmd9cywNCj4gDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICBHZWVydA0KPiANCj4g
LS0NCj4gR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQg
aWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZw0KPiANCj4gSW4gcGVyc29uYWwgY29udmVyc2F0
aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dA0K
PiB3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIi
IG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIC0tIExpbnVzIFRvcnZhbGRzDQo+IA0KDQo=
