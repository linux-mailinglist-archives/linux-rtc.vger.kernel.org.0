Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E34B513DBFA
	for <lists+linux-rtc@lfdr.de>; Thu, 16 Jan 2020 14:32:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728986AbgAPNas (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 16 Jan 2020 08:30:48 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:38759 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729015AbgAPNag (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 16 Jan 2020 08:30:36 -0500
Received: by mail-wm1-f66.google.com with SMTP id u2so3809656wmc.3
        for <linux-rtc@vger.kernel.org>; Thu, 16 Jan 2020 05:30:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=00a+Q4mRpgzQBV1cPIKAh4zjIphnbswAUhTHY9znNH4=;
        b=iTCAlZeCQ7uKek41RyttwGtPeyePxTcuNs5Lg0PW4h0I/E3sHCuQ94y++nt1VdUqtr
         2A+KBexpEoP+z1CQEQ8I65w9PYBtwYTj7YGiA28ER3HXaGy0pTUrHLwkPzhX996SQOTt
         UV2nj6IgmrOdrpoFy+US97/zmPbjPyXPcHpMjqJ0/FwdN+Br46B3MD5wQJGOYksSPGut
         aaVkSK4Q9h3v5mNDvmihWCZhX17PRkiKLcQ7hR7JccTInRCTcU5JK0MahEbXYKdF+zhz
         9D8o3HVIO1rxG/wFPvHVy1E2DdUmAc+Ws1RYc+Uyk8ZNqklrwOcgAWyTEJ1cRtPV//m/
         /nKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=00a+Q4mRpgzQBV1cPIKAh4zjIphnbswAUhTHY9znNH4=;
        b=mp8O88Y6R+hwsnPTMK/yddBEa2ZJAZpuHrn0ThM1Y5U9TkpSKxvXIym0u7pCKm9Drz
         mNg53OTbkTOl90Kecq0zydDvzNaxH6YDB/0ZkJ3KxmQTjiCsEFJRmd/KpHZ8qTfaPI/G
         3FjIiugogOUGc4oaomLS5kJLx9iv20HESCvzr8nM/K6b0JaEo3BdXVHP73wAANqzNTmG
         yswZd3Ov3CNq51w98d6s+aOGHA5CvdW1bCF3dMPKZQxTAiP6iIvxpXuR13BTVU2uS0AY
         4VWPon9y68NUBc8ok6kYlb8zvozcEpMDwq9hbnXtIH042AOe8F6WUgUzg4cqP+nB3w1o
         ID4A==
X-Gm-Message-State: APjAAAVNzaMnkcHo4z56OU4lCq2pv6sD5B8Zm3652tCKFCkbKgXZR7FE
        ZrkFAlHOMw3Is3/WlSRx0/AVfAPlM1Q=
X-Google-Smtp-Source: APXvYqyqW5SAwtM3InQeq3J80Yv0ePNzerEYYhqvdq4g+a9Hcq6N6diGySL/l1tecHCD81O0kGt8WA==
X-Received: by 2002:a1c:7d92:: with SMTP id y140mr5740908wmc.145.1579181434697;
        Thu, 16 Jan 2020 05:30:34 -0800 (PST)
Received: from dell ([2.27.35.221])
        by smtp.gmail.com with ESMTPSA id o4sm28987915wrw.97.2020.01.16.05.30.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2020 05:30:33 -0800 (PST)
Date:   Thu, 16 Jan 2020 13:30:48 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Claudiu Beznea <claudiu.beznea@microchip.com>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com,
        nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
        ludovic.desroches@microchip.com, radu_nicolae.pirea@upb.ro,
        richard.genoud@gmail.com, a.zummo@towertech.it,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-rtc@vger.kernel.org
Subject: Re: [PATCH v3 1/7] dt-bindings: atmel-tcb: remove wildcard
Message-ID: <20200116133048.GO325@dell>
References: <1578997397-23165-1-git-send-email-claudiu.beznea@microchip.com>
 <1578997397-23165-2-git-send-email-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1578997397-23165-2-git-send-email-claudiu.beznea@microchip.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Tue, 14 Jan 2020, Claudiu Beznea wrote:

> Remove wildcard and use the available compatibles.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
> ---
>  Documentation/devicetree/bindings/mfd/atmel-tcb.txt | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

For my own reference:
  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
