Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC3841E33FE
	for <lists+linux-rtc@lfdr.de>; Wed, 27 May 2020 02:18:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726883AbgE0ASs (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 26 May 2020 20:18:48 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:14070 "EHLO
        esa3.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726857AbgE0ASr (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 26 May 2020 20:18:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1590538727; x=1622074727;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=zsE3Q6ziO02lVzKVI5gGQIGQ8b+pIDOVx6g3afOMkao=;
  b=QJX3KP9957K+uaTTzwbEhSYBvFgILAg8L6nRX1G9Rgd5FSrXF2wA48wM
   qo0yMAfSGL8xpeJAA8FpQIffy/sG4aRaF18fy6Dvg/soFo+qL0CqoHOTs
   Ujnc3/PVcCBxFd7i/4mkAUtXb9/nfza1vLVCuAWsSlq5nn6pWzU5ttpOn
   dNoLvbd1T1pnRZI42+uxg4O+DUMuH/TcpK6JCdgdWywEBub6ig50x1ba0
   NPVjUUF+OMJ+AqT609xI2jWOx20O9CEieyIDgwJsdxTYtm18nS9lBzgVU
   rWA0MlhZv//dphV8z/dvxkuXOjdeiEvAfSiI9Cwtksi2CQ9MEUeJ1MXXY
   g==;
IronPort-SDR: e2JyEYXmdxuWYp9fa31+37u0GuKr0GIdDtC6GgTiew6yoLHqBibn57IpGk/14TPtCzk+SHlnJA
 lCzOLvYhdO0FJHWlfHRoaJ84AEZ5VpqFzX2PwW9YjtwGy+8xIU81FqNTzTZFYBOpr96Qco1GWk
 XaFfBNQ7rpz5EhUCE5sDwO3DzZFJXDujg57pL/7Qa1FCYxt14J5YgsvxHf2N5h3Wd1l1HAD98N
 eIOBh9z5qeKNc5kwr03fdq8ria6rMyS25XcODpAW0BrsdanV8E4f+P9qXwEBlsIBc44mBcnqhR
 hrA=
X-IronPort-AV: E=Sophos;i="5.73,439,1583164800"; 
   d="scan'208";a="142899946"
Received: from mail-bn7nam10lp2101.outbound.protection.outlook.com (HELO NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.101])
  by ob1.hgst.iphmx.com with ESMTP; 27 May 2020 08:18:45 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TA5EV7Y44qY034F1awROGaexSF7YCM2A41Nnk8qv4adeV9JTY3MmEFgurCR5tbxYehkIlX4nnSPP6kFEz8hQ7Y7IyMD2dOvi5Tw50ai6G+V0S7yipUkP4GGTh4RrSEdZfuzgK5ePVvaw6cRZ30OAXbrtILxQgq6urSNS7gHQM60Zo0h7QHAn0EPPuP3GYAOtg3jul0hLyqW/HbQzfF1yGepE0/a4W1osJYBC+to0T7AagixNp/azwUGmQt++dwvnOWY/zpqtDh3Stn94RTfEg0QP0m0hwDGka5MY9a4mtQ6rO+D/lSCZozu1e1BOooEPaqcneH1te8S/yBUk01KoOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bH+uX4vg3qT0ILcK30pJCCTwA+K8PJ4X1/YSJw3ny4Q=;
 b=VBMDNFQQLLuI0YZykVLomduKl1O6FO1sclitMxnh2J6qpAWwr0YLkhHKJKfVskefI0HrkaofI9vgOsQ+zGF/q4vtA32uroD7ZI8Dyc0hvjfb2DTufosTH6UNgc5OwV2o6pIRQWEPSNHhbtyW30np5+h4J3NTwmOidkVGvNgbY1iH+SFYCHkgBwdnCEB2RxN5YudLdeLicL3kTa2bvGqPFlxmrJd5uetigyqwuLjUvZYT+rGzVUF2O8VhTL7sDrLqhijpur5nUQp8aRooVtpV1I0KLuIv89UyWGmTjDz2mEe+pj9wviiu8gY/13xq8YNDbtZ9qjGDMkrnGYBLgZU9tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bH+uX4vg3qT0ILcK30pJCCTwA+K8PJ4X1/YSJw3ny4Q=;
 b=qZ9X4WtncB/4cvZNtpQHzhTtWz8GFI+nnw3ZSfi8uroFYIKflzC7wyqlp5QAQy0qOVX13FvSArxB82WrRSrUaArm+kOAw3HzbrM8Qx6obIOFhlarC2xBmXFqWPRe0qURg7QZykUpr8iPdKd7uUdUyXzpr1BPDTBZGq83VL9kj7E=
Received: from BYAPR04MB5176.namprd04.prod.outlook.com (2603:10b6:a03:ce::25)
 by BYAPR04MB5304.namprd04.prod.outlook.com (2603:10b6:a03:cc::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.27; Wed, 27 May
 2020 00:18:43 +0000
Received: from BYAPR04MB5176.namprd04.prod.outlook.com
 ([fe80::893b:8b7:4e88:1466]) by BYAPR04MB5176.namprd04.prod.outlook.com
 ([fe80::893b:8b7:4e88:1466%7]) with mapi id 15.20.3021.029; Wed, 27 May 2020
 00:18:43 +0000
From:   "Maciej W. Rozycki" <macro@wdc.com>
To:     Mikulas Patocka <mpatocka@redhat.com>
CC:     Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        "Maciej W. Rozycki" <macro@linux-mips.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Richard Henderson <rth@twiddle.net>,
        Matt Turner <mattst88@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        alpha <linux-alpha@vger.kernel.org>,
        "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>
Subject: Re: [PATCH v7] alpha: fix memory barriers so that they conform to the
 specification
Thread-Topic: [PATCH v7] alpha: fix memory barriers so that they conform to
 the specification
Thread-Index: AQHWM2ypbObh9GABjU+m6EzsZfrxaai7EdqA
Date:   Wed, 27 May 2020 00:18:43 +0000
Message-ID: <alpine.DEB.2.20.2005270114380.1027@tpp.orcam.me.uk>
References: <CAK8P3a1qN-cpzkcdtNhtMfSwWwxqcOYg9x6DEzt7PWazwr8V=Q@mail.gmail.com>
 <alpine.LFD.2.21.2005111320220.677301@eddie.linux-mips.org>
 <20200513144128.GA16995@mail.rc.ru>
 <alpine.LRH.2.02.2005220920020.20970@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.LRH.2.02.2005221344530.11126@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.LRH.2.02.2005230623410.22664@file01.intranet.prod.int.rdu2.redhat.com>
 <20200523151027.GA10128@mail.rc.ru>
 <alpine.LRH.2.02.2005231131480.10727@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.LRH.2.02.2005231134590.10727@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.LFD.2.21.2005241500230.21168@redsun52.ssa.fujisawa.hgst.com>
 <alpine.LRH.2.02.2005250944210.26265@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.LFD.2.21.2005251500420.21168@redsun52.ssa.fujisawa.hgst.com>
 <alpine.LRH.2.02.2005251151550.4135@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.LRH.2.02.2005261046340.29117@file01.intranet.prod.int.rdu2.redhat.com>
In-Reply-To: <alpine.LRH.2.02.2005261046340.29117@file01.intranet.prod.int.rdu2.redhat.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Alpine 2.20 (DEB 67 2015-01-07)
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [129.253.240.244]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 6e20a655-63f9-42b5-b6aa-08d801d383c4
x-ms-traffictypediagnostic: BYAPR04MB5304:
x-microsoft-antispam-prvs: <BYAPR04MB530439BECA87DB490E747D83B7B10@BYAPR04MB5304.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 04163EF38A
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MK02bxCiXNGSo6Qfe6J4iT+iAr6UrTFMNdU35ubEv0hurGRQYbyfA3rm4vNhbAAr48Q2xjUAn6otHp5hx07BnzcnA6dJugPat3ZUuy+sDsEZ1+FkDLZgK/X8TT7QBw05lmZALHqWsxFljNSPtu7/G5Mx3v8i2tI10O/TR1NhMiQ302b5F/77VuftHCiPlmkv3AuJyTdEcBo+Zz2Eqr70qYEI+cKzbt6YYpJ3oSKpAM2BKcyIOFP6lzG0nhUUQHwwo9hSJG/Ko2b/r0kLeBSERIKrcUIaNUsoSWwDHqXmePZx4Nn0xEh6WLSNe2ilhJ9U
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR04MB5176.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(376002)(39860400002)(346002)(136003)(396003)(186003)(6486002)(66556008)(26005)(66446008)(8676002)(66946007)(64756008)(71200400001)(6506007)(2906002)(76116006)(86362001)(6512007)(91956017)(8936002)(54906003)(66476007)(7416002)(9686003)(6916009)(316002)(478600001)(4326008)(5660300002)(4744005)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: CGN0l87m3/wjgBZ4JIz9NgnCeNTxIxBXjKnG4Q28XtMV5tQdjmIcPg8MHXpqiIyk/GZ0Th2I/IEjzqxYGKQTsa484OAE1z0j4biQwsZFWLZJ7MoQAsp7OdiuZyKZANdI6hc3emxRWyWtx1ErbzW73gY4qPoVUZF3aXD+YJFju6CUYrNYUt8ZcBn8AcoR6s5YsAbe/h0SQeS0EpUg7GXRFMr6SY1L86XDPClDKUiAlYELD10A+eDnugN8ggbfSHIVU4c7DsnfP2cGeSgCxnx27L0BP8lLl8mnFqEhcl9IDODD0g0vvpeW1R3Fu/ZWEV9qQBrGFHPnPO14eYBxP6ZBL7nv/55ST8hFSE0l+mNa5G2rMzioElPpDVKB3l5xI1+xQ8hmhUHTs57ybowaF5QE/rJ38BMoLPrtplCfvXtoVQxrUZq3z46bP+a50ZhqyHjVxC0zqhM59t8qeA/qlsof53GbOxcYytGPjovtk+coxao=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C53E84AE46884C45843C21A8E7088D0F@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e20a655-63f9-42b5-b6aa-08d801d383c4
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 May 2020 00:18:43.1800
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2/f0A3NI/XFOENWyeDqpQsHLMgjSNgQ7nSd70lfaG2mtDDs9DbvcMAreGfiZk3d6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5304
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Tue, 26 May 2020, Mikulas Patocka wrote:

> This patch makes barriers confiorm to the specification.
>=20
> 1. We add mb() before readX_relaxed and writeX_relaxed -
>    memory-barriers.txt claims that these functions must be ordered w.r.t.
>    each other. Alpha doesn't order them, so we need an explicit barrier.
> 2. We add mb() before reads from the I/O space - so that if there's a
>    write followed by a read, there should be a barrier between them.
>=20
> Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
> Fixes: cd0e00c10672 ("alpha: io: reorder barriers to guarantee writeX() a=
nd iowriteX() ordering")
> Fixes: 92d7223a7423 ("alpha: io: reorder barriers to guarantee writeX() a=
nd iowriteX() ordering #2")
> Cc: stable@vger.kernel.org      # v4.17+
> Acked-by: Ivan Kokshaysky <ink@jurassic.park.msu.ru>

 LGTM, thanks for persistence!

Reviewed-by: Maciej W. Rozycki <macro@linux-mips.org>

  Maciej=
