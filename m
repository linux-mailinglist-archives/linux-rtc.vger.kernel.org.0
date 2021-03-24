Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE2E03474A8
	for <lists+linux-rtc@lfdr.de>; Wed, 24 Mar 2021 10:30:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234828AbhCXJ3o (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 24 Mar 2021 05:29:44 -0400
Received: from pegase1.c-s.fr ([93.17.236.30]:38140 "EHLO pegase1.c-s.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234930AbhCXJ3h (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Wed, 24 Mar 2021 05:29:37 -0400
Received: from localhost (mailhub1-int [192.168.12.234])
        by localhost (Postfix) with ESMTP id 4F52xp3WBlz9ty4B;
        Wed, 24 Mar 2021 10:29:34 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
        by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
        with ESMTP id etXQYbBJHaU4; Wed, 24 Mar 2021 10:29:34 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
        by pegase1.c-s.fr (Postfix) with ESMTP id 4F52xp2bBSz9ty41;
        Wed, 24 Mar 2021 10:29:34 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 37A8A8B819;
        Wed, 24 Mar 2021 10:29:35 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
        by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
        with ESMTP id VGE5p_vF_Sgc; Wed, 24 Mar 2021 10:29:35 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 0E25E8B817;
        Wed, 24 Mar 2021 10:29:34 +0100 (CET)
Subject: Re: [PATCH V3 -next] powerpc: kernel/time.c - cleanup warnings
To:     He Ying <heying24@huawei.com>, mpe@ellerman.id.au,
        benh@kernel.crashing.org, paulus@samba.org, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, npiggin@gmail.com,
        msuchanek@suse.de, tglx@linutronix.de, peterz@infradead.org,
        geert@linux-m68k.org, geert+renesas@glider.be,
        kernelfans@gmail.com, frederic@kernel.org
Cc:     linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-rtc@vger.kernel.org
References: <20210324090939.143477-1-heying24@huawei.com>
From:   Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <1f819157-6f21-96ee-68cf-0e3b53865aef@csgroup.eu>
Date:   Wed, 24 Mar 2021 10:29:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210324090939.143477-1-heying24@huawei.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org



Le 24/03/2021 à 10:09, He Ying a écrit :
> We found these warnings in arch/powerpc/kernel/time.c as follows:
> warning: symbol 'decrementer_max' was not declared. Should it be static?
> warning: symbol 'rtc_lock' was not declared. Should it be static?
> warning: symbol 'dtl_consumer' was not declared. Should it be static?
> 
> Declare 'decrementer_max' in powerpc asm/time.h.
> Include linux/mc146818rtc.h in powerpc kernel/time.c where 'rtc_lock'
> is declared. And remove duplicated declaration of 'rtc_lock' in powerpc
> platforms/chrp/time.c because it has included linux/mc146818rtc.h.
> Move 'dtl_consumer' definition behind "include <asm/dtl.h>" because it
> is declared there.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: He Ying <heying24@huawei.com>

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

> ---
> V2:
> - Instead of including linux/mc146818rtc.h in powerpc kernel/time.c, declare
>    rtc_lock in powerpc asm/time.h.
> V3:
> - Recover to V1, that is including linux/mc146818rtc.h in powerpc
>    kernel/time.c. And remove duplicated declaration of 'rtc_lock' in powerpc
>    platforms/chrp/time.c because it has included linux/mc146818rtc.h.
> 
>   arch/powerpc/include/asm/time.h    | 1 +
>   arch/powerpc/kernel/time.c         | 9 ++++-----
>   arch/powerpc/platforms/chrp/time.c | 2 --
>   3 files changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/time.h b/arch/powerpc/include/asm/time.h
> index 8dd3cdb25338..2cd2b50bedda 100644
> --- a/arch/powerpc/include/asm/time.h
> +++ b/arch/powerpc/include/asm/time.h
> @@ -22,6 +22,7 @@ extern unsigned long tb_ticks_per_jiffy;
>   extern unsigned long tb_ticks_per_usec;
>   extern unsigned long tb_ticks_per_sec;
>   extern struct clock_event_device decrementer_clockevent;
> +extern u64 decrementer_max;
>   
>   
>   extern void generic_calibrate_decr(void);
> diff --git a/arch/powerpc/kernel/time.c b/arch/powerpc/kernel/time.c
> index b67d93a609a2..ac81f043bf49 100644
> --- a/arch/powerpc/kernel/time.c
> +++ b/arch/powerpc/kernel/time.c
> @@ -55,8 +55,9 @@
>   #include <linux/sched/cputime.h>
>   #include <linux/sched/clock.h>
>   #include <linux/processor.h>
> -#include <asm/trace.h>
> +#include <linux/mc146818rtc.h>
>   
> +#include <asm/trace.h>
>   #include <asm/interrupt.h>
>   #include <asm/io.h>
>   #include <asm/nvram.h>
> @@ -150,10 +151,6 @@ bool tb_invalid;
>   u64 __cputime_usec_factor;
>   EXPORT_SYMBOL(__cputime_usec_factor);
>   
> -#ifdef CONFIG_PPC_SPLPAR
> -void (*dtl_consumer)(struct dtl_entry *, u64);
> -#endif
> -
>   static void calc_cputime_factors(void)
>   {
>   	struct div_result res;
> @@ -179,6 +176,8 @@ static inline unsigned long read_spurr(unsigned long tb)
>   
>   #include <asm/dtl.h>
>   
> +void (*dtl_consumer)(struct dtl_entry *, u64);
> +
>   /*
>    * Scan the dispatch trace log and count up the stolen time.
>    * Should be called with interrupts disabled.
> diff --git a/arch/powerpc/platforms/chrp/time.c b/arch/powerpc/platforms/chrp/time.c
> index acde7bbe0716..b94dfd5090d8 100644
> --- a/arch/powerpc/platforms/chrp/time.c
> +++ b/arch/powerpc/platforms/chrp/time.c
> @@ -30,8 +30,6 @@
>   
>   #include <platforms/chrp/chrp.h>
>   
> -extern spinlock_t rtc_lock;
> -
>   #define NVRAM_AS0  0x74
>   #define NVRAM_AS1  0x75
>   #define NVRAM_DATA 0x77
> 
