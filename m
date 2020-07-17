Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BAE52240C8
	for <lists+linux-rtc@lfdr.de>; Fri, 17 Jul 2020 18:49:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726634AbgGQQtP (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 17 Jul 2020 12:49:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726221AbgGQQtP (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 17 Jul 2020 12:49:15 -0400
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2B98C0619D2;
        Fri, 17 Jul 2020 09:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=u0JM6c08RReApxGswkP2r77YhwJHKkc2EjdJzkbnHXQ=; b=PYmVXrd42CrpgcWrj/QV0Y8W9l
        Lkohjch9CFGyMhjEMptbgC9m9JrcRkK7fBu48xqCS0dAClLeLwWCRUR1ACgtaRbvRWftg19e0rVi6
        dEU7TiYrdL2FL57rtThihxKSVgSRJdGNKCumUwKexTHzme02lSzYyA8CiEk1JnDDiUfpD7DgIxMs9
        nbvHLH62K7v8Ma6ibkurMeO/X71qUFiRz2iY89380cqL4xVd97H9EJPRVzyGZgqjlC+FyAszRrA3U
        c9rqLZC9E+aOONJ0p4uQk83/2RfXeiA+5wB0OElMbYGHl2fFqmjItphGSTYkHTqluxszY1UpJS/40
        dN5YQS1Q==;
Received: from [2601:1c0:6280:3f0::19c2]
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jwTXp-0008Qz-V4; Fri, 17 Jul 2020 16:49:10 +0000
Subject: Re: linux-next: Tree for Jul 17 (drivers/rtc/rtc-ds1374.o)
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Scott Wood <scottwood@freescale.com>
References: <20200717214036.67fa5379@canb.auug.org.au>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <d36fac01-2a7b-c3f1-84ef-3a1560d18790@infradead.org>
Date:   Fri, 17 Jul 2020 09:49:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200717214036.67fa5379@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 7/17/20 4:40 AM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20200716:
> 
> New tree: init
> Changed tree: dmi (from quilt to git)
> 
> My fixes tree contains:
> 
>   dbf24e30ce2e ("device_cgroup: Fix RCU list debugging warning")
> 
> I revreted 3 commits from the powerpc tree due to reported run time
> problems.
> 
> The sound tree gained a semantic conflict against the dma-mapping tree.
> 
> The security tree still had its build failure for which I applied a patch.
> 
> The tip tree still had one build failure for which I reverted a commit.
> It also gained a conflict against the crypto tree
> 
> The kvm tree gained a conflict and a semantic conflict against the
> tip tree.
> 
> The dmaengine tree gained conflicts against the wireless-drivers-next
> and Linus' trees.
> 
> The pinctrl tree gained a build failure so I used the version from
> next-20200716.
> 
> The set_fs tree gained a conflict against the powerpc tree.
> 
> The init tree gained a conflict against the block tre.
> 
> The akpm-current tree gained conflicts against the crypto and tip trees.
> It also gained a build failure for which I applied a patch.
> 
> Non-merge commits (relative to Linus' tree): 8001
>  8717 files changed, 441636 insertions(+), 169176 deletions(-)
> 
> ----------------------------------------------------------------------------
> 
> I have created today's linux-next tree at
> git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> (patches at http://www.kernel.org/pub/linux/kernel/next/ ).  If you
> are tracking the linux-next tree using git, you should not use "git pull"
> to do so as that will try to merge the new linux-next release with the
> old one.  You should use "git fetch" and checkout or reset to the new
> master.
> 
> You can see which trees have been included by looking in the Next/Trees
> file in the source.  There are also quilt-import.log and merge.log
> files in the Next directory.  Between each merge, the tree was built
> with a ppc64_defconfig for powerpc, an allmodconfig for x86_64, a
> multi_v7_defconfig for arm and a native build of tools/perf. After
> the final fixups (if any), I do an x86_64 modules_install followed by
> builds for x86_64 allnoconfig, powerpc allnoconfig (32 and 64 bit),
> ppc44x_defconfig, allyesconfig and pseries_le_defconfig and i386, sparc
> and sparc64 defconfig and htmldocs. And finally, a simple boot test
> of the powerpc pseries_le_defconfig kernel in qemu (with and without
> kvm enabled).
> 
> Below is a summary of the state of the merge.
> 
> I am currently merging 325 trees (counting Linus' and 83 trees of bug
> fix patches pending for the current merge release).
> 
> Stats about the size of the tree over time can be seen at
> http://neuling.org/linux-next-size.html .
> 
> Status of my local build tests will be at
> http://kisskb.ellerman.id.au/linux-next .  If maintainers want to give
> advice about cross compilers/configs that work, we are always open to add
> more builds.
> 
> Thanks to Randy Dunlap for doing many randconfig builds.  And to Paul
> Gortmaker for triage and bug fixes.
> 

on x86_64:
# CONFIG_WATCHDOG is not set

ld: drivers/rtc/rtc-ds1374.o: in function `ds1374_probe':
rtc-ds1374.c:(.text+0x736): undefined reference to `watchdog_init_timeout'
ld: rtc-ds1374.c:(.text+0x77e): undefined reference to `devm_watchdog_register_device'


-- 
~Randy
Reported-by: Randy Dunlap <rdunlap@infradead.org>
