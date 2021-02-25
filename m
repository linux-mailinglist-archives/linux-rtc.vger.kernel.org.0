Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E798D32480D
	for <lists+linux-rtc@lfdr.de>; Thu, 25 Feb 2021 01:49:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236421AbhBYAtm (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 24 Feb 2021 19:49:42 -0500
Received: from mail2.directv.syn-alias.com ([69.168.106.50]:6045 "EHLO
        mail.directv.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236417AbhBYAtm (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 24 Feb 2021 19:49:42 -0500
DKIM-Signature: v=1; a=rsa-sha1; d=wildblue.net; s=20170921; c=relaxed/simple;
        q=dns/txt; i=@wildblue.net; t=1614214140;
        h=From:Subject:Date:To:MIME-Version:Content-Type;
        bh=SYoRc8S8SDUVyZKqYCiGq8J4MxI=;
        b=Wltwy1LpH1t5yEiUt21n1i8sYGDZiWCJ0Vy9xz9Ip271v1ALcnld4Fjo21WnRzJB
        bPe2TsGTLPj4BPPc5U9je+czUSixfvLUe7TxdOkfirE6WjRxT66cWNWvu4v6etKq
        +RpGzMFkbwEOy0itaZhVU/hwSRGlmWA6VrV372D4rEeUrdP6IW4UElqZC6sO+17r
        XISGM/FoHMzspk5OjDNScw4yq2RB1lnF3SPenQEsLxzYjZLgh6/e29hq2UdbuAhU
        Eqw6dVwGSXNpcOB8aInOwQWA2YdkArjU9RyhJpHCVhlFpJLvIXNFGDgEtlXhsvPz
        LWAFYDe9KjC0fFPBjWvnWw==;
X_CMAE_Category: , ,
X-CNFS-Analysis: v=2.4 cv=Nf0ja0P4 c=1 sm=1 tr=0 ts=6036f3fc cx=a_idp_x a=SHuDM3gc+cTRr4E25xh3Hg==:117 a=9cW_t1CCXrUA:10 a=KGjhK52YXX0A:10 a=FKkrIqjQGGEA:10 a=OGxnvhSY1EUA:10 a=Sol2cfg9i0UA:10 a=IkcTkHD0fZMA:10 a=qa6Q16uM49sA:10 a=eNhqHYoCzkMA:10 a=FT1pz7PEmHkA:10 a=x7bEGLp0ZPQA:10 a=LFTcDyZzlApOshcVs-8A:9 a=QEXdDO2ut3YA:10 a=xo5jKAKm-U-Zyk2_beg_:22 a=kHmCYliWHlBROp4ktEDo:22 a=pHzHmUro8NiASowvMSCR:22 a=Ew2E2A-JSTLzCXPT_086:22
X-CM-Score: 0
X-Scanned-by: Cloudmark Authority Engine
X-Authed-Username: c3VlZGFobEB3aWxkYmx1ZS5uZXQ=
Received: from [10.80.118.13] ([10.80.118.13:33482] helo=md02.jasper.bos.sync.lan)
        by mail2.directv.syn-alias.com (envelope-from <suedahl@wildblue.net>)
        (ecelerity 3.6.25.56547 r(Core:3.6.25.0)) with ESMTP
        id 33/89-18220-BF3F6306; Wed, 24 Feb 2021 19:48:59 -0500
Date:   Wed, 24 Feb 2021 19:48:59 -0500 (EST)
From:   Rowell Hambrick <suedahl@wildblue.net>
Reply-To: rowellhambrick1@gmail.com
Message-ID: <28134883.26141490.1614214139378.JavaMail.zimbra@wildblue.net>
Subject: 
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [5.62.19.56]
X-Mailer: Zimbra 8.7.6_GA_1776 (zclient/8.7.6_GA_1776)
Thread-Index: 1wfmU6ptwJggD5jNfbpZAbPCcQYPsg==
Thread-Topic: 
X-Vade-Verditct: spam:high
X-Vade-Analysis: gggruggvucftvghtrhhoucdtuddrgeduledrkeekgddvhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfujgfpteevqfftpdggkfetufetvfdpqfgfvfenuceurghilhhouhhtmecufedtudenucgohfhorhgsihguuggvnhfjughrucdlhedttddmnecujfgurhepfffhrhfkufggtgfgihfothesthejtgdtredtjeenucfhrhhomheptfhofigvlhhlucfjrghmsghrihgtkhcuoehsuhgvuggrhhhlseifihhluggslhhuvgdrnhgvtheqnecuggftrfgrthhtvghrnhephfeugefhtddvteeiueefveeuheegleefvedtiedtgfejkeefheekueegvddtvdfhnecukfhppedutddrkedtrdduudekrddufedphedriedvrdduledrheeinecuhfhorhgsihguuggvnhfjughrpeffhfhrkffugggtgfhiofhtsehtjegttdertdejnecuufhprghmkfhppeehrdeivddrudelrdehieenucevlhhushhtvghrufhiiigvpeehnecurfgrrhgrmhepihhnvghtpedutddrkedtrdduudekrddufeenpdhmrghilhhfrhhomhepshhuvggurghhlhesfihilhgusghluhgvrdhnvghtnedprhgtphhtthhopehlihhrrghnuggvqhhhugesvhhiphdrudeifedrtghomhen
X-Vade-Client: VIASAT
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Did you get my last mail
