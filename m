Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 983EC2F7F64
	for <lists+linux-rtc@lfdr.de>; Fri, 15 Jan 2021 16:22:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727357AbhAOPVr (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 15 Jan 2021 10:21:47 -0500
Received: from mail-wm1-f47.google.com ([209.85.128.47]:37150 "EHLO
        mail-wm1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725946AbhAOPVr (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 15 Jan 2021 10:21:47 -0500
Received: by mail-wm1-f47.google.com with SMTP id g10so7917913wmh.2;
        Fri, 15 Jan 2021 07:21:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3uR+I0h5etCdkQ5pxMl4CzHqVZjl3PDrBNz6MGPKJ9c=;
        b=Ty/Z3Dyj0Z5ylylvNvbdFedWlQU2H+eFjLzp50bF0JDHLQmLUN/ztZzjeLVKPVGR7G
         6mzHx+lzhNFMDS7jvjq848R+i0lNMqva5Q0UrLsC29vytDmYorornhuAWrXqxCKapu62
         7bQ9F4VkB1Y5FxILWlEPpsJn/GLcIadredNBdfwEtHd8ZF6Chxm/74dyS70wQS4rV+0Y
         CToRH2HCkYVX52AfCRsHFZNPwBbPhMNqZWIKWb5oHcmyQEwW3IPRwT3ysuCl2IVfFMeT
         j4YmQHOYpgQ3hAXf57vWf3QZQPIh7jVirdvCk29SQTpQtrb/Dp/ytknsT9y+CTESD3nI
         bkdw==
X-Gm-Message-State: AOAM530e5VSQ2dQIg0aqYP9+DB/RlUwQH5Fil1UqNlTVqyLutzK8lc+V
        22UYp0TSz+0X+Fb0APC6oLw=
X-Google-Smtp-Source: ABdhPJynzWkOvAzy/5TJgCVbNYondgjXc+qBmzPgNDJIqw21EEi1gfQGFc/fz5xg97fnwA9cw9P74g==
X-Received: by 2002:a7b:c31a:: with SMTP id k26mr9072341wmj.72.1610724064898;
        Fri, 15 Jan 2021 07:21:04 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id v6sm2531535wrx.32.2021.01.15.07.21.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jan 2021 07:21:03 -0800 (PST)
Date:   Fri, 15 Jan 2021 16:21:02 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-rtc@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v5 3/3] rtc: s5m: check the return value of
 s5m8767_rtc_init_reg()
Message-ID: <20210115152102.GA43368@kozik-lap>
References: <20210114102219.23682-1-brgl@bgdev.pl>
 <20210114102219.23682-4-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210114102219.23682-4-brgl@bgdev.pl>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu, Jan 14, 2021 at 11:22:19AM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> This function can fail if regmap operations fail so check its return
> value in probe().
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>  drivers/rtc/rtc-s5m.c | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
