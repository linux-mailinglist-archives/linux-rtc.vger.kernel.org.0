Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FEB62D1B4E
	for <lists+linux-rtc@lfdr.de>; Mon,  7 Dec 2020 21:53:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726865AbgLGUvB (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 7 Dec 2020 15:51:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727422AbgLGUvA (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 7 Dec 2020 15:51:00 -0500
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB870C03BFC2
        for <linux-rtc@vger.kernel.org>; Mon,  7 Dec 2020 12:50:22 -0800 (PST)
Received: by mail-qk1-x735.google.com with SMTP id z188so14028761qke.9
        for <linux-rtc@vger.kernel.org>; Mon, 07 Dec 2020 12:50:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=TsfXgtrn8tOSIu4C3FhT12T57wxAoUaXVJp8A3HkEE0=;
        b=Naz2Y8dP5U2JeBjVSb7/qd38qh7tgLMKy2XToR9d5d28djhnh3kU2GGSPz4gRHVWdk
         TmHb3zYIukNYfLjk/oyiv7lT1HUByNms7tXcoTjlM7qrMAQJ3o08rxv+4edplfxtCo+i
         nwHrvGOXYtM96KeBXO3AG/QuLvvInH6dMp2VR4R4Bo7IH7AZ09qC8JdfAZewEWGMNvUO
         qGJuPH9tvawRuNvWChRgJSiT1CWD76wgIW8DnBQo70qOKNh4uibgPetItnRp33nNneil
         V913Hwi0LqF9FgqW9QcFJdq5m8BQIPPENnLk9cSUeja+QXOMJCHJ61a25Obji+vLw0Q4
         zi7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TsfXgtrn8tOSIu4C3FhT12T57wxAoUaXVJp8A3HkEE0=;
        b=ATwgKNeuQ9+0d0XQ38TxuAXAsTJgUwACbyhKgXDye8aajQOmxOPSBVogTcaWKQ0dqm
         ctlzxVC1gzZe0LSrCJMw0Hdz1nmKBl+zGNOXYnFFerZV6llaDboUKn1GTCdM8JAA4y9Z
         4UcLeI7CF+GLnV7k6vOMKFK7mIEVztDRd88DSMEeGcjzDPqaEZqTDIA0EqUHzGiTSw+h
         qkWPLJxu8k0ZU4+r5su7XlDyNXdoN8Lt5X6P0yd/iTtkpr+VYPn2JJi83HzmUH0MJSLs
         hE+O9soeAfhEOS7n/xNpWwdkrGp5YRKY+Xu4iHgXOcNbFc1Q8rPAqRHjXIiAqvdURKlr
         zYTw==
X-Gm-Message-State: AOAM533T5Tcg13MeYa+MdpsLT/JejbeE4D0htL0+5JbblFgy3tZLxCdf
        TsAHM1LJ/2K0txg5d2R491j9XQ==
X-Google-Smtp-Source: ABdhPJxdDVsRI4y//C7+Svq+MoJr8/3pNSk7/nQH2vJzLytNbyIpmSLQiR3lConUWGiA0YkRtUDNTQ==
X-Received: by 2002:a37:8c03:: with SMTP id o3mr17332052qkd.114.1607374222125;
        Mon, 07 Dec 2020 12:50:22 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-162-115-133.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.115.133])
        by smtp.gmail.com with ESMTPSA id 199sm13025813qkj.61.2020.12.07.12.50.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Dec 2020 12:50:21 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1kmNSe-007fQ6-P0; Mon, 07 Dec 2020 16:50:20 -0400
Date:   Mon, 7 Dec 2020 16:50:20 -0400
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Miroslav Lichvar <mlichvar@redhat.com>,
        John Stultz <john.stultz@linaro.org>,
        Prarit Bhargava <prarit@redhat.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>
Subject: Re: [patch 3/8] rtc: cmos: Make rtc_cmos sync offset correct
Message-ID: <20201207205020.GI5487@ziepe.ca>
References: <20201206214613.444124194@linutronix.de>
 <20201206220541.830517160@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201206220541.830517160@linutronix.de>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Sun, Dec 06, 2020 at 10:46:16PM +0100, Thomas Gleixner wrote:
> The offset for rtc_cmos must be -500ms to work correctly with the current
> implementation of rtc_set_ntp_time() due to the following:
> 
>   tsched       twrite(t2.tv_sec - 1) 	 t2 (seconds increment)
> 
> twrite - tsched is the transport time for the write to hit the device,
> which is negligible for this chip because it's accessed directly.
> 
> t2 - twrite = 500ms according to the datasheet.
> 
> But rtc_set_ntp_time() calculation of tsched is:
> 
>     tsched = t2 - 1sec - (t2 - twrite)
> 
> The default for the sync offset is 500ms which means that the write happens
> at t2 - 1.5 seconds which is obviously off by a second for this device.
> 
> Make the offset -500ms so it works correct.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> ---
>  drivers/rtc/rtc-cmos.c |    3 +++
>  1 file changed, 3 insertions(+)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Matches what sync_cmos_clock() does at least.

My recollection is this change was not supposed to change anything, so
either I got things mixed up and this is wrong:

drivers/rtc/class.c:    rtc->set_offset_nsec =  NSEC_PER_SEC / 2;

Or it faithfully preserved some nonsense from before..

Jason
