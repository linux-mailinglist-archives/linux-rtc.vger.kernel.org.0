Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E1D32562889
	for <lists+linux-rtc@lfdr.de>; Fri,  1 Jul 2022 03:48:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231298AbiGABsM (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 30 Jun 2022 21:48:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229480AbiGABsL (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 30 Jun 2022 21:48:11 -0400
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C28DB76
        for <linux-rtc@vger.kernel.org>; Thu, 30 Jun 2022 18:48:08 -0700 (PDT)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2611m5Wb040835;
        Thu, 30 Jun 2022 20:48:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1656640085;
        bh=/qOiUGEnZT9LRzOlKcoy/N1kBI50zL2jlgHyCtyJcEE=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=LkS/T8dynTSHVkmEVhhdqPeMJFU1TqemTdP6RIha1h5WFP7R/0qmgaAuhjlbvRM5W
         I0HvhzAg7HzPbnx9XP0MCgJej8LApENiXzLr5UVoakvxe96xxGxBwae5jhKqM8ZEC4
         r5Ex9ZN+HEmB9+UsvhK1xLIitG2Mp7eYSBbPh8pM=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2611m5t0071101
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 30 Jun 2022 20:48:05 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 30
 Jun 2022 20:48:04 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 30 Jun 2022 20:48:04 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2611m4p2000407;
        Thu, 30 Jun 2022 20:48:04 -0500
Date:   Thu, 30 Jun 2022 20:48:04 -0500
From:   Nishanth Menon <nm@ti.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
CC:     <linux-rtc@vger.kernel.org>
Subject: Re: [bug report] rtc: Introduce ti-k3-rtc
Message-ID: <20220701014804.etabmwlyahsghrfx@lucrative>
References: <YrqmHSiHfLJegA4v@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <YrqmHSiHfLJegA4v@kili>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Dan,
On 09:56-20220628, Dan Carpenter wrote:
> Hello Nishanth Menon,
> 
> The patch b09d633575e5: "rtc: Introduce ti-k3-rtc" from Jun 23, 2022,
> leads to the following Smatch static checker warning:
> 
> 	drivers/rtc/rtc-ti-k3.c:186 k3rtc_unlock_rtc()
> 	info: return a literal instead of 'ret'
> 
> drivers/rtc/rtc-ti-k3.c
>     180 static int k3rtc_unlock_rtc(struct ti_k3_rtc *priv)
>     181 {
>     182         int ret;
>     183 
>     184         ret = k3rtc_check_unlocked(priv);
>     185         if (!ret)
> --> 186                 return ret;
> 
> It look more intentional when code uses literals:
> 
> 	if (!ret)
> 		return 0;
> 
> The k3rtc_check_unlocked() function can also return error codes so maybe
> this should be:
> 
> 	if (ret <= 0)
> 		return 0;

Interesting for a couple of reasons:
a) yep - if ret was < 0, driver does'nt anticipate that from regmap
   op(unless something really bad happened), so it warn_once
   the information and does continue as if nothing happened.. So, yep, I
   could potentially do <=0 and document the rationale - might be better
   to return ret instead of 0 though. I can send a patch if you agree.
b) How do i reproduce the warning that you reported?

I have been trying to reproduce the check (so that I don't get more
reports) and I am probably missing something obvious (using
https://repo.or.cz/smatch.git and hints from
Documentation/driver-api/media/maintainer-entry-profile.rst):
$ git describe
next-20220630

$ rm drivers/rtc/rtc-ti-k3.o; make CROSS_COMPILE=aarch64-none-linux-gnu- ARCH=arm64 -j1 CHECK=/tmp/x C=2 drivers/rtc/rtc-ti-k3.o
  CHECK   scripts/mod/empty.c
  CALL    scripts/checksyscalls.sh
  CALL    scripts/atomic/check-atomics.sh
  CHECK   arch/arm64/kernel/vdso/vgettimeofday.c
  CC      drivers/rtc/rtc-ti-k3.o
  CHECK   drivers/rtc/rtc-ti-k3.c

$ cat /tmp/x
#!/bin/bash
/tmp/sm/bin/smatch -p=kernel $@
$ /tmp/sm/bin/smatch --version
v0.5.0-8047-g2aeb55346b81
$ cd /tmp/smatch
/tmp/smatch$ git describe
v0.5.0-8047-g2aeb55346b81
$ CROSS_COMPILE=aarch64-none-linux-gnu- ARCH=arm64 /tmp/smatch/smatch_scripts/kchecker drivers/rtc/rtc-ti-k3.c
  SYNC    include/generated/autoconf.h
  CHECK   scripts/mod/empty.c
  CALL    scripts/checksyscalls.sh
  CALL    scripts/atomic/check-atomics.sh
  CHECK   arch/arm64/kernel/vdso/vgettimeofday.c
  CC      drivers/rtc/rtc-ti-k3.o
  CHECK   drivers/rtc/rtc-ti-k3.c
$ aarch64-none-linux-gnu-gcc --version
aarch64-none-linux-gnu-gcc (GNU Toolchain for the A-profile Architecture 10.3-2021.07 (arm-10.29)) 10.3.1 20210621

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
