Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE7FA1D72E3
	for <lists+linux-rtc@lfdr.de>; Mon, 18 May 2020 10:24:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726292AbgERIXK (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 18 May 2020 04:23:10 -0400
Received: from mail-eopbgr60059.outbound.protection.outlook.com ([40.107.6.59]:31462
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726053AbgERIXK (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Mon, 18 May 2020 04:23:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kYul8KkOaV5+rQYNeVhZMNJOp7gwSbl5x2R8ddnSm44y1l60yZvhc6/olRgskfudINIbkcJ9+W5njtiVk3j5+8x7KsmgWLTi7xfPI7DhFOimUgTsPlcxxx0f19f8MiGdzSxg9ncTtZDPfCsMwDOJDD/TSrKKktM84Ccrfl4U622sNHaPGDw7hC8zsMgmuZlRQjtgqRlVIRrasXPNquXaEJ4Q15sxR9k4EoN/HteNIPjeYzqVTmNuUL3r3x5RKDmzILE2RbP7zVkmzg2WZn1jbibjn638/R1QPndVr4fUzoU8C4F2i2cEpdzbMZRHn3guHKW1BZiorHly7eF4R93tWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=64JYowUwd/A5KUmz5cNjCaTYiWkFTBF/uBX/C2NIYjs=;
 b=cmuDpPe0lbYU8FHOKq3qGfDyyw1HepfHKLIzWO1IOYx1g9ZbZqiWhc/K4nb0nOoh9lnqM+Pr7hIjL0RDIHaCmKheVfEJFW/YZpA3w5yXHRNpMTMfQXgzp3HD3Bv/wFUUtZiNH7HupuRafGXDV/s82E3YjcNOx+NKsikvuAvP7OuKGtDOpAn6sfmeQLDzvU/TLIkynZoFomUifpJQJsZCMAKSfHdYIKMIVCsb5C3U+iENZ6tImz/JIed/Q3/MixNiKYahGf/pLi7rGUY43B8dtT620xX9Yn0x4YWh4wPPLi/t5wS4H0t0sWJPrri97Jweh4LKlpq0qPJTQtDwOD2cTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=64JYowUwd/A5KUmz5cNjCaTYiWkFTBF/uBX/C2NIYjs=;
 b=ITPUUWy1dnQwHF2qK/s3y/KrdTF4PZzrxTRPsx7OlJnqer70dFyNooTO4tUxYk+1AyiQsHilOK3h7xS5UatPkCSuDq+CutemXQBWkoyjlglndbhbWli6Jf4GOkXogwDVPxHh52zNmfeLo0gw8jP6PQux4FE5fHTHilZLbUYKDoY=
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com (2603:10a6:20b:2::14)
 by AM6PR04MB5062.eurprd04.prod.outlook.com (2603:10a6:20b:11::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.24; Mon, 18 May
 2020 08:23:06 +0000
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::3c6c:a0e9:9a4e:c51d]) by AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::3c6c:a0e9:9a4e:c51d%7]) with mapi id 15.20.3000.033; Mon, 18 May 2020
 08:23:06 +0000
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
Subject: RE: [PATCH 2/2] dt-bindings: rtc: Convert MXC RTC V2 to json-schema
Thread-Topic: [PATCH 2/2] dt-bindings: rtc: Convert MXC RTC V2 to json-schema
Thread-Index: AQHWKbgdOQb+NRe5ikO0cYaurWM5Xqith2WA
Date:   Mon, 18 May 2020 08:23:06 +0000
Message-ID: <AM6PR04MB4966F61A94DE5C392DA0B23A80B80@AM6PR04MB4966.eurprd04.prod.outlook.com>
References: <1589436805-22923-1-git-send-email-Anson.Huang@nxp.com>
 <1589436805-22923-2-git-send-email-Anson.Huang@nxp.com>
In-Reply-To: <1589436805-22923-2-git-send-email-Anson.Huang@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 20e94edf-95bb-4179-3068-08d7fb04b11b
x-ms-traffictypediagnostic: AM6PR04MB5062:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR04MB5062CE121BD24B46EA183B9680B80@AM6PR04MB5062.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:949;
x-forefront-prvs: 04073E895A
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OaWy+ituiZzcE/Y/c7QqaxaG9g1j+tXLcg5ZnO1vQ6r7O5vOAC05iWXM3Hb6X98bfuQ2KfjUU8ybOE01IIbtwD7pBbUwIU4mCpc/8N6x3aQYTtCAos14ETtj9GnkSpHupkgAIGn/kkfhjLIXMDYhHwsacI+rEiQ/nRQE/88W+UC8DwxeK1dKcVv5FBQRV725ElATrlIx+GVdhMJSVXcFGyIjsdGfiMC+jiv9OoS8JUXRo6npEIj1x0Y+mxBaYDzalgyV5MzSuohctYFKxTJps2nJGdConYvC0XB90+IilLObeyeqs/aunPcl4KyLTdC3aFSrIVqhP/BWrOrpH6Tl7cGRyJhicHOXYjWMeZGoybqJFkt9U4+mMlStiTHasmQKooBQooTQLltsLpF1HSVYidn6C1YTNfGrza8zCNnFmx0NZlnhSU0JNZSYm7Fkdrve
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4966.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(136003)(346002)(376002)(39860400002)(366004)(44832011)(8676002)(64756008)(66446008)(66476007)(8936002)(66946007)(86362001)(52536014)(66556008)(316002)(478600001)(110136005)(186003)(26005)(4326008)(2906002)(71200400001)(76116006)(9686003)(558084003)(33656002)(55016002)(6506007)(7696005)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 2wSF44wMnSuerzUCjQB9/wtagq5Zo5/sufhtVCycOdkJD731btCINxQhF17W6t14dpPcIuTEC7L2x3iQ27yWQrv4p8ZHm6Gm8xj3kQ3NcACdqAanpJFsJ2nwWXRvHnTOtTkQgyJMaqhFBaBQYhV9pWSCw26HsCC45sveA9afLsmcvWuoVj807rjb6kEJZIZsGVJkuMG4yg+khMDeBAuz48P1mO9TlCPHcAdIVyzFgOV5xQyhx1dw4ziENAHlUcowgLRWs+7wf1e+tLLHsDZr1U+POxfaVXe7aoXIKKq+91wrew/rJhwyIxQShgorv38qgEXW3nIAhDgaEt6m4VLqiy/Qt4HslP/eXo300hKW7HQhYEs45nJ8EUfHcNNlcQQG/dnP4PZbkZikd4j69iF96W7Bm8JspCAtYQ5/Hzex+wP0uouJOmdDNCJDPdLeafm5h2sxqu03Z0SLUWvNdzTE7wZq2UFWeWvxHjsIGhuFLX1bptR0l1oppdWHil4xQp5U
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20e94edf-95bb-4179-3068-08d7fb04b11b
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2020 08:23:06.5614
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VBZxiIakuTNf2J/bzllc5RP4CRSkRa1BMGFYGlnbg/a7XJRi4+kG/72cY2Qr+w2G9M3RJiu9H8Sz4L/Mj6xKGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5062
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

PiBGcm9tOiBBbnNvbiBIdWFuZyA8QW5zb24uSHVhbmdAbnhwLmNvbT4NCj4gU2VudDogVGh1cnNk
YXksIE1heSAxNCwgMjAyMCAyOjEzIFBNDQo+IA0KPiBDb252ZXJ0IHRoZSBNWEMgUlRDIFYyIGJp
bmRpbmcgdG8gRFQgc2NoZW1hIGZvcm1hdCB1c2luZyBqc29uLXNjaGVtYS4NCj4gDQo+IFNpZ25l
ZC1vZmYtYnk6IEFuc29uIEh1YW5nIDxBbnNvbi5IdWFuZ0BueHAuY29tPg0KDQpSZXZpZXdlZC1i
eTogRG9uZyBBaXNoZW5nIDxhaXNoZW5nLmRvbmdAbnhwLmNvbT4NCg0KUmVnYXJkcw0KQWlzaGVu
Zw0K
