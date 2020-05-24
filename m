Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CF1E1DFF7B
	for <lists+linux-rtc@lfdr.de>; Sun, 24 May 2020 16:54:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729338AbgEXOye (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 24 May 2020 10:54:34 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:49942 "EHLO
        esa3.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727985AbgEXOyd (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 24 May 2020 10:54:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1590332074; x=1621868074;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=XzPy3+UK3OJ5MmxtUzlcb3qzhDwq70xP4iqC9RrPnIg=;
  b=ax1rQpN5J8UiwvIvlyEAuPVpexbjJNWNI6Pa/RMzAlhDV2FpCB2WYilO
   WcQGXZ3Durj+43W2E0C3Stxm0q8sowj9znJS+bNQ1tYE36TUoyof5za+o
   HhMVlsJYZz8RU86NyIPWEDIH+WWbhSZAHiN9jrORPmbBPY8t+LxmSsoic
   K7P3cjusyPo+aPHGFBE1CsBTsQw+Yqz/pPq9/hdIhpbxfgNV8EkgFhguR
   WHFvSPW7F8uLkm9XofUAHU0Ue0NtwLSWeeK31qa8/IE7LxtpvGdyeVB0R
   bFeSJtzqIVeANdrGE+x7if/ecVIMeJ1PBfbQdJYLCtqoPvWB6QN1iQqwQ
   Q==;
IronPort-SDR: IDgUK54jZYzByhMm+PeGDpN8DXIlPgNTNjNBiOOm0zFy/J47RlKyjKe2VQ2FmCoXxtWncJkyhB
 3btyT+27yXTAOgKnJ+Lli3FVAptprRxyZnYZ2GJ7PUCTPiTdkLJ0uVYyIPBIelSFCWp/gXmV/e
 yeMB6cETxzCVJnn91KR5ZkpTWa7kf3TJ+DaTexKl/6+SuElrMFW3Uz8bSbuzyXKZYoRLETBKxb
 55a+MomDX6YDKA5JajEu13LDx6d5U5QhPZF0T+txVMfUf4F2VRr3DniUrNEnWQx9Zhnh27H+wm
 iw4=
X-IronPort-AV: E=Sophos;i="5.73,430,1583164800"; 
   d="scan'208";a="142741408"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 24 May 2020 22:54:34 +0800
IronPort-SDR: Ax1ctgjUGsQQN2QoOLTfZnWwcyq3M5wYnro3AcSehSBLiX4w+76KRVjLct6yiUYix8x6hBkTMY
 ScRDfoj8YxcccEB2arO4xnBKOeWo6PR+Y=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2020 07:44:29 -0700
IronPort-SDR: dbJVEDR4+fbXPHXqWtTqtyCwAshLf2t5QTYWLoLB8peyg2qDhEkjBpBxGUy8sIsnUXKbf6eAIh
 LQZQqgS4pbSg==
WDCIronportException: Internal
Received: from unknown (HELO redsun52) ([10.149.66.28])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2020 07:54:32 -0700
Date:   Sun, 24 May 2020 15:54:26 +0100 (BST)
From:   "Maciej W. Rozycki" <macro@wdc.com>
To:     Mikulas Patocka <mpatocka@redhat.com>
cc:     Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        "Maciej W. Rozycki" <macro@linux-mips.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Richard Henderson <rth@twiddle.net>,
        Matt Turner <mattst88@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        alpha <linux-alpha@vger.kernel.org>,
        linux-serial@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH v5] alpha: fix memory barriers so that they conform to
 the specification
In-Reply-To: <alpine.LRH.2.02.2005231134590.10727@file01.intranet.prod.int.rdu2.redhat.com>
Message-ID: <alpine.LFD.2.21.2005241500230.21168@redsun52.ssa.fujisawa.hgst.com>
References: <CAK8P3a1qN-cpzkcdtNhtMfSwWwxqcOYg9x6DEzt7PWazwr8V=Q@mail.gmail.com> <alpine.LRH.2.02.2005070931280.1718@file01.intranet.prod.int.rdu2.redhat.com> <CAK8P3a3UdCJL6C07_W7pkipT1Xmr_0G9hOy1S+YXbB4_tKt+gg@mail.gmail.com>
 <alpine.LFD.2.21.2005100209340.487915@eddie.linux-mips.org> <alpine.LRH.2.02.2005101443290.15420@file01.intranet.prod.int.rdu2.redhat.com> <alpine.LFD.2.21.2005111320220.677301@eddie.linux-mips.org> <20200513144128.GA16995@mail.rc.ru>
 <alpine.LRH.2.02.2005220920020.20970@file01.intranet.prod.int.rdu2.redhat.com> <alpine.LRH.2.02.2005221344530.11126@file01.intranet.prod.int.rdu2.redhat.com> <alpine.LRH.2.02.2005230623410.22664@file01.intranet.prod.int.rdu2.redhat.com> <20200523151027.GA10128@mail.rc.ru>
 <alpine.LRH.2.02.2005231131480.10727@file01.intranet.prod.int.rdu2.redhat.com> <alpine.LRH.2.02.2005231134590.10727@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Alpine 2.21 (LFD 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Mikulas,

> This patch makes barriers confiorm to the specification.
> 
> 1. We add mb() before readX_relaxed and writeX_relaxed -
>    memory-barriers.txt claims that these functions must be ordered w.r.t.
>    each other. Alpha doesn't order them, so we need an explicit barrier.
> 2. We add mb() before reads from the I/O space - so that if there's a
>    write followed by a read, there should be a barrier between them.
> 
> Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
> Fixes: cd0e00c10672 ("alpha: io: reorder barriers to guarantee writeX() and iowriteX() ordering")
> Fixes: 92d7223a7423 ("alpha: io: reorder barriers to guarantee writeX() and iowriteX() ordering #2")
> Cc: stable@vger.kernel.org      # v4.17+
> Acked-by: Ivan Kokshaysky <ink@jurassic.park.msu.ru>

 Thank you for your effort to address this regression.  I have looked 
through your code and the context it is to be applied to.  Overall it 
looks good to me, however I still have one concern as detailed below 
(please accept my apologies if you find it tedious to address all the 
points raised in the course of this review).

> Index: linux-stable/arch/alpha/include/asm/io.h
> ===================================================================
> --- linux-stable.orig/arch/alpha/include/asm/io.h	2020-05-23 10:01:22.000000000 +0200
> +++ linux-stable/arch/alpha/include/asm/io.h	2020-05-23 17:29:22.000000000 +0200
[...]
> @@ -487,16 +501,59 @@ extern inline void writeq(u64 b, volatil
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
>  
>  /*
> + * The _relaxed functions must be ordered w.r.t. each other, but they don't
> + * have to be ordered w.r.t. other memory accesses.
> + */
> +static inline u8 readb_relaxed(const volatile void __iomem *addr)
> +{
> +	mb();
> +	return __raw_readb(addr);
> +}
[etc.]

 Please observe that changing the `*_relaxed' entry points from merely 
aliasing the corresponding `__raw_*' handlers to more elaborate code 
sequences (though indeed slightly only, but still) makes the situation 
analogous to one we have with the ordinary MMIO accessor entry points.  
Those regular entry points have been made `extern inline' and wrapped 
into:

#if IO_CONCAT(__IO_PREFIX,trivial_rw_bw) == 1

and:

#if IO_CONCAT(__IO_PREFIX,trivial_rw_lq) == 1

respectively, with corresponding out-of-line entry points available, so 
that there is no extra inline code produced where the call to the relevant 
MMIO accessor is going to end up with an actual function call, as this 
would not help performance in any way and would expand code unnecessarily 
at all call sites.

 Therefore I suggest that your new `static inline' functions follow the 
pattern, perhaps by grouping them with the corresponding ordinary accessor 
functions in arch/alpha/include/asm/io.h within the relevant existing 
#ifdef, and then by making them `extern inline' and providing out-of-line 
implementations in arch/alpha/kernel/io.c, with the individual symbols 
exported.  Within arch/alpha/kernel/io.c the compiler will still inline 
code as it sees fit as it already does, e.g. `__raw_readq' might get 
inlined in `readq' if it turns out cheaper than arranging for an actual 
call, including all the stack frame preparation for `ra' preservation; 
it's less likely with say `writeq' which probably always ends with a tail 
call to `__raw_writeq' as no stack frame is required in that case.

 That for the read accessors.

> +static inline void writeb_relaxed(u8 b, volatile void __iomem *addr)
> +{
> +	mb();
> +	__raw_writeb(b, addr);
> +}
[etc.]

 Conversely for the write accessors, keeping in mind what I have noted 
above, I suggest that you just redirect the existing aliases to the 
ordinary accessors, as there will be no difference anymore between the 
respective ordinary and relaxed accessors.  That is:

#define writeb_relaxed(b, addr)	writeb(b, addr)

etc.

 Let me know if you have any further questions or comments.

  Maciej
