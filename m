Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B3A730BDAD
	for <lists+linux-rtc@lfdr.de>; Tue,  2 Feb 2021 13:07:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230165AbhBBMGr (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 2 Feb 2021 07:06:47 -0500
Received: from mail-ej1-f54.google.com ([209.85.218.54]:40270 "EHLO
        mail-ej1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229466AbhBBMGi (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 2 Feb 2021 07:06:38 -0500
Received: by mail-ej1-f54.google.com with SMTP id i8so13102744ejc.7;
        Tue, 02 Feb 2021 04:06:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ioCs7jX8PpMZEdV94Jce7rrfIgnnopVE3O3WTTOq4js=;
        b=PY/QOhFFDGKXA0/4Q5opvyBSnqGf8Du9zkLlbvn78xIukuQZMuhIHKBWWIuU9wfP3X
         GRcn29Zla9uUiB7pyWsnWNgzAjrqx2bhOCbSsq+DRZpeHKWPbWcXH5OtBdhtw9xLjTV+
         66+8hEW9LPcNToTiJvLLb7IB/194LQHzBTzcfXEbqeIrhzihhy8Xb4JgdX0scWTRu85P
         2kEjx3e0iokA+Z+YeUX+u2ej58PJkCNlbl1VAHMuDFqJ6jdzcOEJbFpuEMIR9ypaXyIN
         uoIw16Qpa3duJOQrzwRXFTmUyMAmC8VllBtzUpmpTIx9TL3w/ZxgO5y96p3dOnQjk8E1
         wctg==
X-Gm-Message-State: AOAM533bpKKpqG45YyxLYIQ6w/cYXDfiGymrmPQF1z4fBhKrbev9tI7s
        h54F+JPrWnZjlxbEc08ps7I=
X-Google-Smtp-Source: ABdhPJxNdU19cnfZx6k75SncIXL1aablhJWlAaUBu3k7qFqFEv7b7uKxZw2z2bjsp1GynMMLG5N7Nw==
X-Received: by 2002:a17:907:3e27:: with SMTP id hp39mr21866609ejc.187.1612267556555;
        Tue, 02 Feb 2021 04:05:56 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id b3sm1778936edw.14.2021.02.02.04.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Feb 2021 04:05:55 -0800 (PST)
Date:   Tue, 2 Feb 2021 13:05:52 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] rtc: s3c: stop setting bogus time
Message-ID: <20210202120552.u6i5dxgibh5yyjvt@kozik-lap>
References: <20210202112934.3612726-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210202112934.3612726-1-alexandre.belloni@bootlin.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Tue, Feb 02, 2021 at 12:29:33PM +0100, Alexandre Belloni wrote:
> It doesn't make sense to set the RTC to a default value at probe time. Let
> the core handle invalid date and time.
> 
> Also, this is basically dead code since commit 22652ba72453 ("rtc: stop
> validating rtc_time in .read_time")
> 
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> ---
>  drivers/rtc/rtc-s3c.c | 15 ---------------
>  1 file changed, 15 deletions(-)
> 

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
