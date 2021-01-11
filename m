Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DDA42F1544
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Jan 2021 14:38:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733087AbhAKNhg (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 11 Jan 2021 08:37:36 -0500
Received: from mail-ed1-f43.google.com ([209.85.208.43]:46905 "EHLO
        mail-ed1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733085AbhAKNhd (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 11 Jan 2021 08:37:33 -0500
Received: by mail-ed1-f43.google.com with SMTP id v26so9855865eds.13;
        Mon, 11 Jan 2021 05:37:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/p6z+cfcMRRJbK5oOjot9uxJkXRvECRXp10L4gMtvXc=;
        b=t9SWUkr2snnbTOMhPq5/sNMK7UYb/RZAFgG1huDVY6zsYmdPBxeQxoCqyGryjg1qZQ
         9eUPGfw9hz8wzBoNZ36YOzRMiDRWEgSNE6wd5kPIvqXCk9P54TxdskAZSkivcmzeXZ23
         E5Gu0rEtJoatUHTWKzx2GKf4xhiEtRZ3vnVwkUX6e2rlnncAw7jZVmP3adYbWnm2ZRBO
         yE29GqqC5aRJMUtLqX4/RK9SvfvoGOkLsPfNKOLKfVR9FWBGIcwDXz9dW+7Bz4EFGKeX
         c0dZJkmRvK7LQXN5Dxs4rxuvAs/es3JSTN4zRLCcBYnU6TnFz9l79lLMvujqDrCxuopn
         siEA==
X-Gm-Message-State: AOAM532CAN73poM9OkPq9vuHTTLGm4XbjhSOfsAQ5d8tacA229j9Kj7u
        JO4Q1Tcd2PmOgDc2t/u9mAY=
X-Google-Smtp-Source: ABdhPJzJ/xljqZbCR66lwjkB+vNgn2WYSOBgA0dFm0ZVg0NR3NnvbhnYVI4K+wr8HnzKUlSV8sB0dQ==
X-Received: by 2002:a50:abc6:: with SMTP id u64mr14326229edc.21.1610372211038;
        Mon, 11 Jan 2021 05:36:51 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id c14sm7773877edy.56.2021.01.11.05.36.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jan 2021 05:36:49 -0800 (PST)
Date:   Mon, 11 Jan 2021 14:36:48 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-rtc@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v4 3/3] rtc: s5m: use devm_i2c_new_dummy_device()
Message-ID: <20210111133648.GC34341@kozik-lap>
References: <20210111124027.21586-1-brgl@bgdev.pl>
 <20210111124027.21586-4-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210111124027.21586-4-brgl@bgdev.pl>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Mon, Jan 11, 2021 at 01:40:27PM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> Use the managed variant of i2c_new_dummy_device() to shrink code and
> remove the goto label. We can drop the remove callback now too.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>  drivers/rtc/rtc-s5m.c | 31 +++++++------------------------
>  1 file changed, 7 insertions(+), 24 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
