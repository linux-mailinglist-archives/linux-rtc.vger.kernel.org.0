Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5BE91D72DE
	for <lists+linux-rtc@lfdr.de>; Mon, 18 May 2020 10:22:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726880AbgERIWN (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 18 May 2020 04:22:13 -0400
Received: from mail-eopbgr60075.outbound.protection.outlook.com ([40.107.6.75]:14916
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726053AbgERIWN (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Mon, 18 May 2020 04:22:13 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AcNibDdGIH+mcxJOxG5rGR4T7983+kVGEjxDgGsF6OKpyiPszTAAY4dlo1cd4zETXHOohSroNEMWAasvaYbkzjvhwPatHa5kJ8PaHuI3EPtef53LRuYUu4QAgHQ9ZDgEaAzdPe4qtClhj9acNBNgE93CyHf6b00QszwM0AWtKzDgqLgvH18/WGtrREfpHOqQ5G+dnREYLpWkVpj8v6mHl97qSrkJAtqX2oO7QC5IIlg81Vh6xkvqQQ+VKsqWLNGcICiFdHYexX2bbqjePKWebu37fnNZpPPIb3189IlLQQaRrqc2NAXSXfUvKFeWTlhaX+oEaGuOCkD5nvJ0QKlEcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qk44PiulreE2GHUcWJ3yJHep3oe220fBad+UoMHe568=;
 b=oPzOBEiQ5SNG+nNQhj0eXSvh7G0kL5/CAjT3PUh86hvUbHUJh7C8FG55K6CD+bvnwdGKAhZHPxHqHqerpvv8qROKTt5bBjRw1qxMuqMz4by30Dsw7h+qZ3XeC5UA61zblAPIZ5aTR7vP55SIYDO86EV1/OvfZQXjreBwjsk/V+vJKcgM1Dz7D6pkWm013AcjBjloYDYIoUzpQSwz77ycm14HJVYCJZxcX6JqSjNG/y7+yvzUdhqr5c+AsoKVZDoGBzSTdFX9Gx9pf8UbrXnqWU8icAIzXRgNvToor4yxLDMvQHfZ6aWlOV/lsVmudd9ZO7fFda2tRtioMnWy2+xEBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qk44PiulreE2GHUcWJ3yJHep3oe220fBad+UoMHe568=;
 b=k72I2PjFe++xnr7DD0hkcwuUM2qX7TGSfuva2YNVoM9EPqbTvwLaRttRKOtcMS3DEU82nYJ8LFZA/a2QCYFHbn1uHAwj+xbPuVpT2Rkxs5dVaIT7z14u9I8AwZauqj6sLNuNXww+EkhNNInCpnQk+EYxxznTyFm0QrcW27tzH4U=
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com (2603:10a6:20b:2::14)
 by AM6PR04MB4773.eurprd04.prod.outlook.com (2603:10a6:20b:10::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.26; Mon, 18 May
 2020 08:22:09 +0000
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::3c6c:a0e9:9a4e:c51d]) by AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::3c6c:a0e9:9a4e:c51d%7]) with mapi id 15.20.3000.033; Mon, 18 May 2020
 08:22:09 +0000
From:   Aisheng Dong <aisheng.dong@nxp.com>
To:     Anson Huang <anson.huang@nxp.com>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "tremyfr@gmail.com" <tremyfr@gmail.com>,
        "p.bruenn@beckhoff.com" <p.bruenn@beckhoff.com>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC:     dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH 1/2] dt-bindings: rtc: Convert MXC RTC to json-schema
Thread-Topic: [PATCH 1/2] dt-bindings: rtc: Convert MXC RTC to json-schema
Thread-Index: AQHWKbgcc7RomLaMP0CjqGuIdgrwv6ithztg
Date:   Mon, 18 May 2020 08:22:09 +0000
Message-ID: <AM6PR04MB4966D63DDC5568C27ECF224680B80@AM6PR04MB4966.eurprd04.prod.outlook.com>
References: <1589436805-22923-1-git-send-email-Anson.Huang@nxp.com>
In-Reply-To: <1589436805-22923-1-git-send-email-Anson.Huang@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: badca178-50bd-456f-52ad-08d7fb048f4a
x-ms-traffictypediagnostic: AM6PR04MB4773:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR04MB47739FB7D4C9A65317E45CBA80B80@AM6PR04MB4773.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:949;
x-forefront-prvs: 04073E895A
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: p46ZcTXV0tQ3+Qn8aW3gDLRVmB19xA37DidgakbM7NVDdLKhiKT/CqCoOtALIf5yCvfI4qtT+Mj1ILUanD85qUei2paQrohto+AsyFZx0jPLc6tlx+cLp3ILyJWjN/E86akJUE1MmvOKQEgFi/VtFYjId02FH0WpB8uI6UoLwWXt+PccKN30wx0WtJz7ZI18bGKjY6ATAEwdNY5n3C2qXzpMQtgDK15jt97UrAtmRKJUUoX6fPEsJlFmgg2lGO5dwPDenDakH0zl6o0TrJOEySQwUBaKutUevutVZizq76jxgDNa47AuIwJhPt5uR72cZScsBAuOq0eAAhrimJrmbVkbTEmasscAYs7qhupf5COCDflltMRToNgm24cEXKgVVqvsA/D/tXElc1KQxMYj8RS23KLSB+L/sR9xqwoiQ/Sa0TSi2dJJRHB2/NVVKwQS
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4966.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(376002)(39860400002)(346002)(136003)(366004)(558084003)(71200400001)(33656002)(4326008)(6506007)(26005)(7696005)(5660300002)(44832011)(110136005)(186003)(316002)(64756008)(66476007)(8936002)(66556008)(66446008)(76116006)(2906002)(66946007)(55016002)(9686003)(86362001)(478600001)(8676002)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: J1tPgDzbLX9LB9Tv5Lcptp1apDcb8kJtUxOUuUSyvp3dbKMbAmWTjcHLBHbcK+Acx0dgu6dfgOr9i7arVr72FAN2aCRMkZG0poJgSQFWUlskIlOhuuEFvVpBtlGd0hcn/31UBHmE1bKX9GMoGmeMC1XSo1Bt6yeqE+48NmDf0NRPjGE1ExrhXekMxdDg7TL6BRoxG7y5+5KDsMHuZDLdJyWcvtVKcdfeSVHLwx1MQAQkgZftCgiidsnDEMs3YR7zkA0Kql74KjtMHX/z5AxOUT8uo4KY9uY9KSkZymNpY9+SiPwiT1Mrkhu8ivUUXnD4mbCWmA1cNujPWL6Q8O1U9gm5t2UxA/G8hpP8U3QuG011rDOSbQ8jwiNnJQ/SLTdI1SGAlZWKofCJtp/+RImIevp3aWtcIpRnr5bx65157R27OW8M3VnD+8vWjCDT34FS9Zi7hXPEcs/4Ly2Ac+rxg3N4M87FSBE2++cB0+zOcI99qOxlijceY2zLq5+l69HF
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: badca178-50bd-456f-52ad-08d7fb048f4a
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2020 08:22:09.7438
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s/zl9sfNYWA20WrJogs87UoaFNo8JBBjvnJ3HGFzRzvYzATp6iRAmCl3bo7UtDAy5Bp8xTGJJfO2VbyWb3WZmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4773
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

PiBGcm9tOiBBbnNvbiBIdWFuZyA8QW5zb24uSHVhbmdAbnhwLmNvbT4NCj4gU2VudDogVGh1cnNk
YXksIE1heSAxNCwgMjAyMCAyOjEzIFBNDQo+IA0KPiBDb252ZXJ0IHRoZSBNWEMgUlRDIGJpbmRp
bmcgdG8gRFQgc2NoZW1hIGZvcm1hdCB1c2luZyBqc29uLXNjaGVtYS4NCj4gDQo+IFNpZ25lZC1v
ZmYtYnk6IEFuc29uIEh1YW5nIDxBbnNvbi5IdWFuZ0BueHAuY29tPg0KDQpSZXZpZXdlZC1ieTog
RG9uZyBBaXNoZW5nIDxhaXNoZW5nLmRvbmdAbnhwLmNvbT4NCg0KUmVnYXJkcw0KQWlzaGVuZw0K
