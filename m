Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 81DBE190B99
	for <lists+linux-rtc@lfdr.de>; Tue, 24 Mar 2020 11:57:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727112AbgCXK5s (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 24 Mar 2020 06:57:48 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:36408 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727095AbgCXK5s (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 24 Mar 2020 06:57:48 -0400
Received: by mail-wr1-f67.google.com with SMTP id 31so14803749wrs.3
        for <linux-rtc@vger.kernel.org>; Tue, 24 Mar 2020 03:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=DOA10CRKFJGu8b5wtBJ2yLDJfOkq/sBVSQmhdUC4ypY=;
        b=XzPL8rmmIVLxiwmtlWoRSXM0V5GpXguC00V1OiwP6D+VNJxQu2ndjNH1DMpUjS28PQ
         95d55nIqF92A5FJDVtQG8Jzb05LrNkZmBvwRk7n8ylcgjn2PXRej0umf85yg4FJtwRIf
         1d6lguSarwuUd5qHDfnSxccZHHNay6tDtznC6eX6gJLk7WG884AyXPo8Re0uFBwUCYRa
         EJvXYkjpEwuOQ+odcen6exRdljEbPs65kh1We93B8zHf7DKnQ9qYQGqCQip3Pr7KLhbt
         MOAHL7oolr6K4tZz9zakUdiOTZZ68VaGyLG81OjlfADYwnOzGldnrkt5IBYVDJai8PZR
         9zoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=DOA10CRKFJGu8b5wtBJ2yLDJfOkq/sBVSQmhdUC4ypY=;
        b=OT7wbQ098kb7HoRuR5+YwqF79sqBStbeaAE/DPwAzerAR1aS/WmUZNq/EEMjxFbfxd
         lKDNyxQQk1hLAoZqhAjZDKM5zAkCGCEWE0lIsOKNCwxwQhWYvktfCfGwmqt4QinjRjY2
         r/GcF5xmflaWSZLSXB0yQM8b6NJaQTEjEm2GPmRZVpw/rPwPaY4IZEWRxcx8UMx9LHLQ
         YOtQDire8HXm2a+ANlc+XGHni9dzx4/OeLicWOjmKf3w1Lrtgvu5cSEO/rL96NNwr4sK
         KUR/PK8Nv2F3Hllvzx44XWskEM53fJpToxwcJ2LkB7Pt/eR2exJhFQCW51/NUtmKRNhD
         V7vA==
X-Gm-Message-State: ANhLgQ34Fj0NR7rNnrm+0FkvqnQcSKO2vdQjX22oNpLU0lQt1SZa208D
        D/bFYcbmGWtMJncanBX7a8wsMQ==
X-Google-Smtp-Source: ADFU+vt2lLYB0Tgp6XRl+Nd0We086rBZL2iX6nYLI5T5X83Rf+H43VbfRkFbjVqQgqGMEydvpBiXPQ==
X-Received: by 2002:adf:ba48:: with SMTP id t8mr36017493wrg.329.1585047466432;
        Tue, 24 Mar 2020 03:57:46 -0700 (PDT)
Received: from dell ([2.27.35.213])
        by smtp.gmail.com with ESMTPSA id c7sm17274309wrn.49.2020.03.24.03.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2020 03:57:45 -0700 (PDT)
Date:   Tue, 24 Mar 2020 10:58:35 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Andreas Kemnade <andreas@kemnade.info>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
        stefan@agner.ch, b.galvani@gmail.com, phh@phh.me,
        letux-kernel@openphoenux.org, knaack.h@gmx.de, lars@metafoo.de,
        pmeerw@pmeerw.net, linux-iio@vger.kernel.org, jic23@kernel.org
Subject: Re: [PATCH v7 7/7] mfd: rn5t618: cleanup i2c_device_id
Message-ID: <20200324105835.GJ5477@dell>
References: <20200320081105.12026-1-andreas@kemnade.info>
 <20200320081105.12026-8-andreas@kemnade.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200320081105.12026-8-andreas@kemnade.info>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Fri, 20 Mar 2020, Andreas Kemnade wrote:

> That list was just empty, so it can be removed if .probe_new
> instead of .probe is used
> 
> Suggested-by: Lee Jones <lee.jones@linaro.org>
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---
> Functional independent from the other patches, but since they are
> touching similar areas, commit/merge conflicts would occur.
>  drivers/mfd/rn5t618.c | 11 ++---------
>  1 file changed, 2 insertions(+), 9 deletions(-)

For my own reference:
  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
