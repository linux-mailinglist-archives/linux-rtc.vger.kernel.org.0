Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 378B476F3C4
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Aug 2023 22:02:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231469AbjHCUCm (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 3 Aug 2023 16:02:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229835AbjHCUCl (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 3 Aug 2023 16:02:41 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B859D420A;
        Thu,  3 Aug 2023 13:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=nNerFmd6ptjo+dv4OPvS78cjhai5tEdqMXx2pR/SI/I=; b=WR/rzPm+JY2QxPYgET1mIU+C5x
        8KD0+ZN0p+sroepubAVdtu73DUl9tnEE94Fq4xzOh+zQiEX7s1Y5RliaBgXwJP4agZ5tjj93FRvlN
        G7ZWkMkD/UETQnfbr9CAydgZDIOF/hkYY/LFJCsnMbWS/iEouFbTrQ2u1nQlg0G7Ft46oMOg9oyl0
        YtM7hc+gRCJudFz2SKh8OORMfryYGvVsEe6bMTmptF6PaqRXe7HElvQwRMzmYv8ZKY+XUXsh3DRsB
        UY8zXU/s6C4OHUNMMIbSZHWXuwNKCuTVWVAmDBtVs6R4/H/dzOgjs+2clZr3KNQyCS/5EeDQzJ0gh
        n4GFOUIA==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1qReWj-005eRN-8r; Thu, 03 Aug 2023 20:02:29 +0000
Date:   Thu, 3 Aug 2023 21:02:29 +0100
From:   Matthew Wilcox <willy@infradead.org>
To:     kernel test robot <lkp@intel.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        linux-arm-msm@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-serial@vger.kernel.org,
        Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Subject: Re: [linux-next:master] BUILD REGRESSION
 fb4327106e5250ee360d0d8b056c1eef7eeb9a98
Message-ID: <ZMwH1WuEb1JEtZ4o@casper.infradead.org>
References: <202308040141.gUjtZ32J-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202308040141.gUjtZ32J-lkp@intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Fri, Aug 04, 2023 at 01:34:01AM +0800, kernel test robot wrote:
> arm-linux-gnueabi-ld: storage.c:(.text+0x27c): undefined reference to `__brelse'
> arm-linux-gnueabi-ld: storage.c:(.text+0x9c): undefined reference to `__bread_gfp'
> storage.c:(.text+0x22c): undefined reference to `__bread_gfp'
> storage.c:(.text+0x64): undefined reference to `__brelse'

I think something like this would fix it.  Jens?  Christoph?

+++ b/fs/romfs/Kconfig
@@ -2,6 +2,7 @@
 config ROMFS_FS
        tristate "ROM file system support"
        depends on BLOCK || MTD
+       select BUFFER_HEAD
        help
          This is a very small read-only file system mainly intended for
          initial ram disks of installation disks, but it could be used for

romfs has a few options and I spent no time looking at this closely;
maybe not every version of romfs needs buffer heads.
