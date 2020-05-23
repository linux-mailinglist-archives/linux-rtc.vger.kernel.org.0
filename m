Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FEBC1DF7EE
	for <lists+linux-rtc@lfdr.de>; Sat, 23 May 2020 17:10:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387905AbgEWPKk (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 23 May 2020 11:10:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387815AbgEWPKk (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 23 May 2020 11:10:40 -0400
Received: from mail.rc.ru (mail.rc.ru [IPv6:2a01:7e00:e000:1bf::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A57EC061A0E;
        Sat, 23 May 2020 08:10:39 -0700 (PDT)
Received: from mail.rc.ru ([2a01:7e00:e000:1bf::1]:33304)
        by mail.rc.ru with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ink@jurassic.park.msu.ru>)
        id 1jcVnB-0002ep-Iy; Sat, 23 May 2020 16:10:29 +0100
Date:   Sat, 23 May 2020 16:10:27 +0100
From:   Ivan Kokshaysky <ink@jurassic.park.msu.ru>
To:     Mikulas Patocka <mpatocka@redhat.com>
Cc:     "Maciej W. Rozycki" <macro@linux-mips.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Richard Henderson <rth@twiddle.net>,
        Matt Turner <mattst88@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        alpha <linux-alpha@vger.kernel.org>,
        linux-serial@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH v4] alpha: fix memory barriers so that they conform to
 the specification
Message-ID: <20200523151027.GA10128@mail.rc.ru>
References: <CAK8P3a1qN-cpzkcdtNhtMfSwWwxqcOYg9x6DEzt7PWazwr8V=Q@mail.gmail.com>
 <alpine.LRH.2.02.2005070931280.1718@file01.intranet.prod.int.rdu2.redhat.com>
 <CAK8P3a3UdCJL6C07_W7pkipT1Xmr_0G9hOy1S+YXbB4_tKt+gg@mail.gmail.com>
 <alpine.LFD.2.21.2005100209340.487915@eddie.linux-mips.org>
 <alpine.LRH.2.02.2005101443290.15420@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.LFD.2.21.2005111320220.677301@eddie.linux-mips.org>
 <20200513144128.GA16995@mail.rc.ru>
 <alpine.LRH.2.02.2005220920020.20970@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.LRH.2.02.2005221344530.11126@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.LRH.2.02.2005230623410.22664@file01.intranet.prod.int.rdu2.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.LRH.2.02.2005230623410.22664@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Sat, May 23, 2020 at 06:26:54AM -0400, Mikulas Patocka wrote:
> The commits cd0e00c10672 and 92d7223a7423 broke boot on the Alpha Avanti
> platform. The patches move memory barriers after a write before the write.
> The result is that if there's iowrite followed by ioread, there is no
> barrier between them.
> 
> The Alpha architecture allows reordering of the accesses to the I/O space,
> and the missing barrier between write and read causes hang with serial
> port and real time clock.
> 
> This patch makes barriers confiorm to the specification.
> 
> 1. We add mb() before readX_relaxed and writeX_relaxed -
>    memory-barriers.txt claims that these functions must be ordered w.r.t.
>    each other. Alpha doesn't order them, so we need an explicit barrier.
> 2. We add mb() before reads from the I/O space - so that if there's a
>    write followed by a read, there should be a barrier between them.

You missed the second mb() in extern inline u16 readw(). Otherwise,

Acked-by: Ivan Kokshaysky <ink@jurassic.park.msu.ru>

> Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
> Fixes: cd0e00c10672 ("alpha: io: reorder barriers to guarantee writeX() and iowriteX() ordering")
> Fixes: 92d7223a7423 ("alpha: io: reorder barriers to guarantee writeX() and iowriteX() ordering #2")
> Cc: stable@vger.kernel.org      # v4.17+
> 
> ---
>  arch/alpha/include/asm/io.h |   43 ++++++++++++++++++++++++++++---------------
>  arch/alpha/kernel/io.c      |   28 +++++++++++++++++++++-------
>  2 files changed, 49 insertions(+), 22 deletions(-)
> 
> Index: linux-stable/arch/alpha/include/asm/io.h
> ===================================================================
> --- linux-stable.orig/arch/alpha/include/asm/io.h	2020-05-23 10:01:22.000000000 +0200
> +++ linux-stable/arch/alpha/include/asm/io.h	2020-05-23 10:01:22.000000000 +0200
> @@ -310,14 +310,18 @@ static inline int __is_mmio(const volati
>  #if IO_CONCAT(__IO_PREFIX,trivial_io_bw)
>  extern inline unsigned int ioread8(void __iomem *addr)
>  {
> -	unsigned int ret = IO_CONCAT(__IO_PREFIX,ioread8)(addr);
> +	unsigned int ret;
> +	mb();
> +	ret = IO_CONCAT(__IO_PREFIX,ioread8)(addr);
>  	mb();
>  	return ret;
>  }
>  
>  extern inline unsigned int ioread16(void __iomem *addr)
>  {
> -	unsigned int ret = IO_CONCAT(__IO_PREFIX,ioread16)(addr);
> +	unsigned int ret;
> +	mb();
> +	ret = IO_CONCAT(__IO_PREFIX,ioread16)(addr);
>  	mb();
>  	return ret;
>  }
> @@ -358,7 +362,9 @@ extern inline void outw(u16 b, unsigned
>  #if IO_CONCAT(__IO_PREFIX,trivial_io_lq)
>  extern inline unsigned int ioread32(void __iomem *addr)
>  {
> -	unsigned int ret = IO_CONCAT(__IO_PREFIX,ioread32)(addr);
> +	unsigned int ret;
> +	mb();
> +	ret = IO_CONCAT(__IO_PREFIX,ioread32)(addr);
>  	mb();
>  	return ret;
>  }
> @@ -403,15 +409,18 @@ extern inline void __raw_writew(u16 b, v
>  
>  extern inline u8 readb(const volatile void __iomem *addr)
>  {
> -	u8 ret = __raw_readb(addr);
> +	u8 ret;
> +	mb();
> +	ret = __raw_readb(addr);
>  	mb();
>  	return ret;
>  }
>  
>  extern inline u16 readw(const volatile void __iomem *addr)
>  {
> -	u16 ret = __raw_readw(addr);
> +	u16 ret;
>  	mb();
> +	ret = __raw_readw(addr);
>  	return ret;
>  }
>  
> @@ -451,14 +460,18 @@ extern inline void __raw_writeq(u64 b, v
>  
>  extern inline u32 readl(const volatile void __iomem *addr)
>  {
> -	u32 ret = __raw_readl(addr);
> +	u32 ret;
> +	mb();
> +	ret = __raw_readl(addr);
>  	mb();
>  	return ret;
>  }
>  
>  extern inline u64 readq(const volatile void __iomem *addr)
>  {
> -	u64 ret = __raw_readq(addr);
> +	u64 ret;
> +	mb();
> +	ret = __raw_readq(addr);
>  	mb();
>  	return ret;
>  }
> @@ -487,14 +500,14 @@ extern inline void writeq(u64 b, volatil
>  #define outb_p		outb
>  #define outw_p		outw
>  #define outl_p		outl
> -#define readb_relaxed(addr)	__raw_readb(addr)
> -#define readw_relaxed(addr)	__raw_readw(addr)
> -#define readl_relaxed(addr)	__raw_readl(addr)
> -#define readq_relaxed(addr)	__raw_readq(addr)
> -#define writeb_relaxed(b, addr)	__raw_writeb(b, addr)
> -#define writew_relaxed(b, addr)	__raw_writew(b, addr)
> -#define writel_relaxed(b, addr)	__raw_writel(b, addr)
> -#define writeq_relaxed(b, addr)	__raw_writeq(b, addr)
> +#define readb_relaxed(addr)	(mb(), __raw_readb(addr))
> +#define readw_relaxed(addr)	(mb(), __raw_readw(addr))
> +#define readl_relaxed(addr)	(mb(), __raw_readl(addr))
> +#define readq_relaxed(addr)	(mb(), __raw_readq(addr))
> +#define writeb_relaxed(b, addr)	(mb(), __raw_writeb(b, addr))
> +#define writew_relaxed(b, addr)	(mb(), __raw_writew(b, addr))
> +#define writel_relaxed(b, addr)	(mb(), __raw_writel(b, addr))
> +#define writeq_relaxed(b, addr)	(mb(), __raw_writeq(b, addr))
>  
>  /*
>   * String version of IO memory access ops:
> Index: linux-stable/arch/alpha/kernel/io.c
> ===================================================================
> --- linux-stable.orig/arch/alpha/kernel/io.c	2020-05-23 10:01:22.000000000 +0200
> +++ linux-stable/arch/alpha/kernel/io.c	2020-05-23 10:01:22.000000000 +0200
> @@ -16,21 +16,27 @@
>  unsigned int
>  ioread8(void __iomem *addr)
>  {
> -	unsigned int ret = IO_CONCAT(__IO_PREFIX,ioread8)(addr);
> +	unsigned int ret;
> +	mb();
> +	ret = IO_CONCAT(__IO_PREFIX,ioread8)(addr);
>  	mb();
>  	return ret;
>  }
>  
>  unsigned int ioread16(void __iomem *addr)
>  {
> -	unsigned int ret = IO_CONCAT(__IO_PREFIX,ioread16)(addr);
> +	unsigned int ret;
> +	mb();
> +	ret = IO_CONCAT(__IO_PREFIX,ioread16)(addr);
>  	mb();
>  	return ret;
>  }
>  
>  unsigned int ioread32(void __iomem *addr)
>  {
> -	unsigned int ret = IO_CONCAT(__IO_PREFIX,ioread32)(addr);
> +	unsigned int ret;
> +	mb();
> +	ret = IO_CONCAT(__IO_PREFIX,ioread32)(addr);
>  	mb();
>  	return ret;
>  }
> @@ -148,28 +154,36 @@ EXPORT_SYMBOL(__raw_writeq);
>  
>  u8 readb(const volatile void __iomem *addr)
>  {
> -	u8 ret = __raw_readb(addr);
> +	u8 ret;
> +	mb();
> +	ret = __raw_readb(addr);
>  	mb();
>  	return ret;
>  }
>  
>  u16 readw(const volatile void __iomem *addr)
>  {
> -	u16 ret = __raw_readw(addr);
> +	u16 ret;
> +	mb();
> +	ret = __raw_readw(addr);
>  	mb();
>  	return ret;
>  }
>  
>  u32 readl(const volatile void __iomem *addr)
>  {
> -	u32 ret = __raw_readl(addr);
> +	u32 ret;
> +	mb();
> +	ret = __raw_readl(addr);
>  	mb();
>  	return ret;
>  }
>  
>  u64 readq(const volatile void __iomem *addr)
>  {
> -	u64 ret = __raw_readq(addr);
> +	u64 ret;
> +	mb();
> +	ret = __raw_readq(addr);
>  	mb();
>  	return ret;
>  }
> 
