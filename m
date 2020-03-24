Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E01D190B06
	for <lists+linux-rtc@lfdr.de>; Tue, 24 Mar 2020 11:33:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727120AbgCXKdI (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 24 Mar 2020 06:33:08 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:42553 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727130AbgCXKdH (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 24 Mar 2020 06:33:07 -0400
Received: by mail-wr1-f67.google.com with SMTP id h15so8517248wrx.9
        for <linux-rtc@vger.kernel.org>; Tue, 24 Mar 2020 03:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=IrXGZHQOvRbVrdhyf/YbRhdpgB7gnLqs/mPRG5sDLy8=;
        b=RKCe9AqJsuMkR/lMvYJWSWdCJnc1DPMPpVeLHXBVb+QXi4dQYkPD+C/kF0fBm3IHMF
         WEt7EA8eWrnGZDE+025B+xvia3MieEBNPFwUPFuJSKS7A//eicws5oy4X4T8tqm11l05
         94eqTdiVFrR/HvNYYACXO3bLpi2UUTnj9M6fnwIWBuyn7BuxOgfRgiNRy2F/pUKfutyw
         /TzVrgmhXXMqkodvQ1gkSAyO9biPMerMgQwY5O6NnNRjxpn+t18puUb8vLX5k3gwoPM4
         PiSrnmaRu3kOGD+2VEZjV6L1wYvs7tfOvs/mF0WanLBpv3BTNWjfKrTiLRieE0IMqoC0
         T9uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=IrXGZHQOvRbVrdhyf/YbRhdpgB7gnLqs/mPRG5sDLy8=;
        b=PvDNJoQtOb6QxK5zrIbJ9cLGb0M54Kd5q5e1rcC4xmhYsJcQax5Un4f9cvDnV77Q+1
         +kFGwUGf2GDChgfPBt9vU3tk4gicEUju6kFvv4QwUY7bZG3i5D7i27zyk+jyzEUYAqxx
         DIezxFfpAWoCzCkOqxZxTw5RQfTeEgB3GvE5tqWgr2R6wXctG+AZjhDm2gsn7pWdnkWD
         R2YK4RJNHRa0SnxYgIxFGD5yw2Rh6VD/oJSMPqa1/DFKQespw2T5u0pi84J15/PBTlW4
         uWVENByhMuNJZF+EGnWI6LCVaW6ZsHtbmq9sPvNqsmOHO8ddHkqkgxxRSyG80OKnuilv
         iFSQ==
X-Gm-Message-State: ANhLgQ06iRpyVm8kj2PtmXy/6848O5QAu7kzmX3HcHf7iHHQK/KCstP6
        mdFIAx2ly37CSODQe9XoGqtspQ==
X-Google-Smtp-Source: ADFU+vtHp9ysDVVXPgqTHTn9l98ma/U7CpdYITGz7jbimYm+l7hrGG3ySHDK1cpVtfXjt18py39TrA==
X-Received: by 2002:adf:de01:: with SMTP id b1mr10143860wrm.376.1585045984218;
        Tue, 24 Mar 2020 03:33:04 -0700 (PDT)
Received: from dell ([2.27.35.213])
        by smtp.gmail.com with ESMTPSA id o26sm3564319wmc.33.2020.03.24.03.33.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2020 03:33:03 -0700 (PDT)
Date:   Tue, 24 Mar 2020 10:33:52 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Andreas Kemnade <andreas@kemnade.info>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
        stefan@agner.ch, b.galvani@gmail.com, phh@phh.me,
        letux-kernel@openphoenux.org, knaack.h@gmx.de, lars@metafoo.de,
        pmeerw@pmeerw.net, linux-iio@vger.kernel.org, jic23@kernel.org
Subject: Re: [PATCH v7 2/7] mfd: rn5t618: add IRQ support
Message-ID: <20200324103352.GH5477@dell>
References: <20200320081105.12026-1-andreas@kemnade.info>
 <20200320081105.12026-3-andreas@kemnade.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200320081105.12026-3-andreas@kemnade.info>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Fri, 20 Mar 2020, Andreas Kemnade wrote:

> This adds support for IRQ handling in the RC5T619 which is required
> for properly implementing subdevices like RTC.
> For now only definitions for the variant RC5T619 are included.
> 
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---
> Changes in v7:
> more cleanups in IRQ init
> 
> Changes in v5:
> rn5t618_irq_init static
> 
> Changes in v4:
> merge rn5t618-irq.c into rn5t618.c
> use macros for IRQ table
> 
> Changes in v3:
> alignment cleanup
> 
> Changes in v2:
> - no dead code, did some more testing and thinking for that
> - remove extra empty lines
>  drivers/mfd/Kconfig         |  1 +
>  drivers/mfd/rn5t618.c       | 78 ++++++++++++++++++++++++++++++++++++-
>  include/linux/mfd/rn5t618.h | 15 +++++++
>  3 files changed, 93 insertions(+), 1 deletion(-)

Looks good to me now:

For my own reference:
  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
