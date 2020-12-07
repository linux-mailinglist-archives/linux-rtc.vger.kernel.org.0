Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A79382D1B90
	for <lists+linux-rtc@lfdr.de>; Mon,  7 Dec 2020 22:02:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726438AbgLGVAl (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 7 Dec 2020 16:00:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726208AbgLGVAl (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 7 Dec 2020 16:00:41 -0500
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com [IPv6:2607:f8b0:4864:20::72f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 952E7C061794
        for <linux-rtc@vger.kernel.org>; Mon,  7 Dec 2020 12:59:55 -0800 (PST)
Received: by mail-qk1-x72f.google.com with SMTP id b144so14000860qkc.13
        for <linux-rtc@vger.kernel.org>; Mon, 07 Dec 2020 12:59:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=SsoIYjBoSOJL9ZsEeEbVAcU4nkxuyAtiLgrYShov/wE=;
        b=i1it63IPF7Tvk8uDkG0531W5MNt7LWyQnwaM2j4BTI/61OlhQiI+VJ+wpKpxZtDvPg
         vEbdjngT0eARrKE1T1aDZ5DUhPlRd6VaejmMAMYVKthNBOHrPSsuBBQ1ZuENokzB6dtF
         yhrP4xK+GkxHP/lT20KBd8CQD8v9ddhEUt4KyKzk90DAVyxhAhPv2/fOScXi86WtSoDS
         pxFsfOu40Viw5B0+ZIGnOOGOs/6fZWDZT73kzeOZ+cW8r4ZP6WIiNfwcU4nfgYwCvIn9
         HnuENOVvoflwLViv82Sro/eJNtOgTprMrJh9VG29iHH8wAWpwGeiaNDBl54i69ekJJuK
         THvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=SsoIYjBoSOJL9ZsEeEbVAcU4nkxuyAtiLgrYShov/wE=;
        b=pYT/RIzplsGhYbWZ6H6m6s+wsiu80feVd2nfPYLoCRzXSWtGZLBc+33xbY7f97Lkbg
         9FKeW14RvNQOXda/8I4hUeWwzHqRcizbyroh8EzMd1/Z8OlZw79v0Ioklr+UazHl++aq
         NqswoLkyl9Moxbb98lNSqK6Df4R2SRhYqq6U8VfXYRRpLr8R6vFSJvIMcorrDzBTl3X8
         iHDccBAreuMDWzSB5rBpLOGpwyENrMt2/8cy+ihqVgKW+TGApPDWlKu3SQl6Km9ObJ1R
         uMc4Q8hntSLkyKXnsOewDmQqHRrQzVgnV+osx3zX10ZQuRPjQdT+bVPCtSRCUAzuWsR0
         5/CQ==
X-Gm-Message-State: AOAM5320TUdvlJQ/9XGpy6+OYLKgEE6wgHeOWomxHBwPS0/7vouth0sq
        5WMBwxHwqSsyuADUbSd1V0pT1w==
X-Google-Smtp-Source: ABdhPJy/AObM5SP970JiKVbzk0clsLDS7Pku3nuk+S/w0OWrxn3W3HE1Z7GvrEj0qJrW03GFHY7u/Q==
X-Received: by 2002:a05:620a:138b:: with SMTP id k11mr25874513qki.323.1607374794219;
        Mon, 07 Dec 2020 12:59:54 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-162-115-133.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.115.133])
        by smtp.gmail.com with ESMTPSA id s8sm11621645qtw.61.2020.12.07.12.59.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Dec 2020 12:59:53 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1kmNbs-007fZb-Sn; Mon, 07 Dec 2020 16:59:52 -0400
Date:   Mon, 7 Dec 2020 16:59:52 -0400
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Miroslav Lichvar <mlichvar@redhat.com>,
        John Stultz <john.stultz@linaro.org>,
        Prarit Bhargava <prarit@redhat.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>
Subject: Re: [patch 6/8] ntp, rtc: Move rtc_set_ntp_time() to ntp code
Message-ID: <20201207205952.GL5487@ziepe.ca>
References: <20201206214613.444124194@linutronix.de>
 <20201206220542.166871172@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201206220542.166871172@linutronix.de>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Sun, Dec 06, 2020 at 10:46:19PM +0100, Thomas Gleixner wrote:
> rtc_set_ntp_time() is not really RTC functionality as the code is just a
> user of RTC. Move it into the NTP code which allows further cleanups.
> 
> Requested-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> ---
>  drivers/rtc/Makefile  |    1 
>  drivers/rtc/systohc.c |   61 ----------------------------------
>  include/linux/rtc.h   |   34 -------------------
>  kernel/time/ntp.c     |   88 ++++++++++++++++++++++++++++++++++++++++++++++++--
>  4 files changed, 85 insertions(+), 99 deletions(-)

Fair enough, it is asymmetric with how HCTOSYS works, but not a big
deal

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
