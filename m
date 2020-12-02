Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F12E82CBD51
	for <lists+linux-rtc@lfdr.de>; Wed,  2 Dec 2020 13:51:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727727AbgLBMtu (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 2 Dec 2020 07:49:50 -0500
Received: from mail-ej1-f65.google.com ([209.85.218.65]:36149 "EHLO
        mail-ej1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727102AbgLBMtt (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 2 Dec 2020 07:49:49 -0500
Received: by mail-ej1-f65.google.com with SMTP id lt17so4084683ejb.3;
        Wed, 02 Dec 2020 04:49:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=QGP/cI1ppSs+Z2bhsa3yCGL4LAkjArcrNGJNdVKbNVo=;
        b=WX5GUuGNvTQUyDwwSqntUOFnYmjhBPUiHBoe8KN3cnPEkOKVM5NzzAYl5dkyWZ7fni
         TLOk8+2lSdidu8BFLCRNI3AXn9I6eHIWYtWH8tAFzJSmBlz+S4Lh0DJaMzbjDc1ypnhQ
         P9vhe2dE37b3W7awqBRiyreTNBBjr9J9zlV++zNZbD7xQf7ehJVj7rgg+Uay+fDVw64L
         KrR8+ZhEde3xCNbkpxODzBitRHRTN8Q5aGXBn9FPKKg9nf8hXa4pP0Sv6UVDzMWIfw15
         NlmHhewl0pcZBZJYh2fMl/wONGOBIgE+HcvWIBAoOE5O4vHwMFEs5D8UWic8kMrdPjPe
         cv2w==
X-Gm-Message-State: AOAM5314v/VuI79YCGtF7kfE9+LEsJ0OkBesB90w5++H/txsdqL0GK/Y
        5M1TVebskZNW/lhfsGvyX7NqLbDDC98=
X-Google-Smtp-Source: ABdhPJzZ+aaWqelqQzWjbO5YpRIHXvdccF7rfmmkwP9zeiTUbeEETLUOQB3ov/J5JiUjUwMtUX0s3A==
X-Received: by 2002:a17:906:a899:: with SMTP id ha25mr2101968ejb.203.1606913347390;
        Wed, 02 Dec 2020 04:49:07 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id k3sm1115118ejd.36.2020.12.02.04.49.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Dec 2020 04:49:06 -0800 (PST)
Date:   Wed, 2 Dec 2020 14:49:04 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux-rtc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH 2/2] rtc: s3c: Remove dead code related to periodic tick
 handling
Message-ID: <20201202124904.GB36340@kozik-lap>
References: <20201202111318.5353-1-m.szyprowski@samsung.com>
 <CGME20201202111328eucas1p1e6fff3706b790d104b76f95085dbb0c1@eucas1p1.samsung.com>
 <20201202111318.5353-2-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201202111318.5353-2-m.szyprowski@samsung.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Wed, Dec 02, 2020 at 12:13:18PM +0100, Marek Szyprowski wrote:
> Support for periodic tick interrupts has been moved from the RTC class to
> the HR-timers long time ago. Then it has been removed from this driver by
> commits 80d4bb515b78 ("RTC: Cleanup rtc_class_ops->irq_set_state") and
> 696160fec162 ("RTC: Cleanup rtc_class_ops->irq_set_freq()"). They however
> did not remove all the code related to the tick handling. Do it now then.
> 

Update also the bindings (one IRQ less), please.

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
