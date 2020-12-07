Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DE742D1B9D
	for <lists+linux-rtc@lfdr.de>; Mon,  7 Dec 2020 22:08:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726718AbgLGVFy (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 7 Dec 2020 16:05:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726269AbgLGVFy (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 7 Dec 2020 16:05:54 -0500
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com [IPv6:2607:f8b0:4864:20::82a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0588C061794
        for <linux-rtc@vger.kernel.org>; Mon,  7 Dec 2020 13:05:07 -0800 (PST)
Received: by mail-qt1-x82a.google.com with SMTP id a6so8091315qtw.6
        for <linux-rtc@vger.kernel.org>; Mon, 07 Dec 2020 13:05:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=nKAI0S93ME7i51hseZ6+wmpHBdg0HI9aWCiEZunfjik=;
        b=Soxx/3N87PGx3mb5h4nU9Y/1F8HFpxwJU3/MJ0CuDY+YN8OP9ACnbLtyxJ8Tb1X8IU
         iQYU8f8pjcrD6PDHJKHkthDsupHcCsffWRG14SORf3yzaND07VUUJCr8elCDRf+RQh3K
         FIei72MzqrbuDO0n+BkP/5R2H64pPI3IwWV9r0/XFeEIkJwupKsKnrxBVgedybjx92vk
         ROyk2ju1mOewZF/mB/98rKMHu2KDDNnD4PbvV4RZQTfTopE/Jf7GEDq0l8ii8wFssBR7
         XfSXbdl1azrnUgwDW4U43iXyGjoeYbnD7ymnTH4Oo27RxG0DE0MO1nWLfQdtpTSeCn/J
         x5nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=nKAI0S93ME7i51hseZ6+wmpHBdg0HI9aWCiEZunfjik=;
        b=Q29o/oyhI9MM3s9slNrWyzZvY5PZLml4tIZEcpIK8S0jj+dQWNA+qlrbLv8vIbV7kG
         NCrL1K2B5Z8wKjti117xAf0R3ItK2yG8jst+DOTRLXYHnMPEKdeKMD0UZpx78T+Y8knl
         cLXEp2OW7eHjpCn7jwxDj8WWfvXIbLt9VzQIHyigRyTB15fA3OATu/veO11m4VGzPbwx
         NRkGV5DmShi3QhWILGX2CUa3Alq6D1olNDpCBgIv96Pb//aK/jpQ/IWJveTKciTYoPae
         BnhFlRbcaekc6DLeTG2EwIKJQosJiOa8QmSvOncWNH78IlkLQTynyYABjQkibULMBrOX
         rBMw==
X-Gm-Message-State: AOAM530maYPN+jakET4ZOCzvu7QJzW5GmRZ4iqwnJRa9VcbxF9+lHEPu
        aXVsoFCGiwuDsa7dRz2XiK5ZOQ==
X-Google-Smtp-Source: ABdhPJxj04RcFkKycBCmmM8xlj5X137EFzrpVhlQXfFhcfVDinY9DvcLduWOoOwwCNTtmiIK5wSaAw==
X-Received: by 2002:ac8:5450:: with SMTP id d16mr25669307qtq.33.1607375107115;
        Mon, 07 Dec 2020 13:05:07 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-162-115-133.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.115.133])
        by smtp.gmail.com with ESMTPSA id h16sm13760997qko.135.2020.12.07.13.05.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Dec 2020 13:05:06 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1kmNgv-007fdg-Qh; Mon, 07 Dec 2020 17:05:05 -0400
Date:   Mon, 7 Dec 2020 17:05:05 -0400
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Miroslav Lichvar <mlichvar@redhat.com>,
        John Stultz <john.stultz@linaro.org>,
        Prarit Bhargava <prarit@redhat.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>
Subject: Re: [patch 8/8] ntp: Consolidate the RTC update implementation
Message-ID: <20201207210505.GM5487@ziepe.ca>
References: <20201206214613.444124194@linutronix.de>
 <20201206220542.355743355@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201206220542.355743355@linutronix.de>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Sun, Dec 06, 2020 at 10:46:21PM +0100, Thomas Gleixner wrote:
>  /*
>   * If we have an externally synchronized Linux clock, then update RTC clock
>   * accordingly every ~11 minutes. Generally RTCs can only store second
> @@ -686,6 +621,10 @@ static bool sync_cmos_clock(void)
>   */
>  static void sync_hw_clock(struct work_struct *work)
>  {
> +	static unsigned long offset_nsec = NSEC_PER_SEC / 2;

A comment here explaining this is the default: because the platform is
assumed to use CMOS, and by the way, this whole thing is obsolete
don't use it, seems appropriate..

The time split is clearer if you think of it from a bus/datasheet
perspective, less clear if you try to measure the system directly, eg
from an alarm. But, I think this  has a better chance of some rtclib
driver authors to fill in the datasheet value at least.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
