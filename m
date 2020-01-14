Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1FFB013B5BE
	for <lists+linux-rtc@lfdr.de>; Wed, 15 Jan 2020 00:26:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728774AbgANX0w (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 14 Jan 2020 18:26:52 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:45684 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728650AbgANX0w (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 14 Jan 2020 18:26:52 -0500
Received: by mail-oi1-f194.google.com with SMTP id n16so13600533oie.12
        for <linux-rtc@vger.kernel.org>; Tue, 14 Jan 2020 15:26:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=OD3k/3afce55aKrw/+Sox/ckv7HTxlsRWXlz74Axqv4=;
        b=eIohtV1x7jwU+6Pni8jgCloYltssBssW/K67CQhQ/hpxkcycx+4IWjv7KzZ10YNBcU
         ihrRCde7oLR6dEGNOA75/2wUA2BrupM8FNUaQ3Ga2pZUG8vdDMffQjEPmrHr+odezqus
         IJVgb/nJ6a497Yc13zOV5b7UhDrbGxOiXsNOzk7mSg5SjmFi0n25xBvpVTzcKn5I+P9D
         0v1bSCxbyhcZ9wevtC8dkvlo72lv+hw543o1pcbvSpD9Gxu+irmN0TMzlBIr+l2ibL69
         y1jfUaPzZyuqxBl+FQyerzWaFBsEGP9gFxDNo5p2jSua25uzwgnwRKhgWgos86pmbH+X
         CuTg==
X-Gm-Message-State: APjAAAUmQ6VvB4SBMB1ElvbPwPPzq8JB9Kk+c6ZS6qKG9oULBnJE/jQI
        8V3KhcyJqxEIGwLIWWI8qB5uZIo=
X-Google-Smtp-Source: APXvYqzcxfvi2gTk4C3tsyyoZPrUTojotAN+u4Z20vMEnLVo9fcZLObp7NAZGxkwJdKqFtCZB/WWWA==
X-Received: by 2002:aca:f1d4:: with SMTP id p203mr18421062oih.116.1579044411058;
        Tue, 14 Jan 2020 15:26:51 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id s6sm125243otd.72.2020.01.14.15.26.49
        for <linux-rtc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2020 15:26:50 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 2209ae
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Tue, 14 Jan 2020 17:26:49 -0600
Date:   Tue, 14 Jan 2020 17:26:49 -0600
From:   Rob Herring <robh@kernel.org>
To:     Claudiu Beznea <claudiu.beznea@microchip.com>
Cc:     robh+dt@kernel.org, lee.jones@linaro.org, mark.rutland@arm.com,
        nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
        ludovic.desroches@microchip.com, radu_nicolae.pirea@upb.ro,
        richard.genoud@gmail.com, a.zummo@towertech.it,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-rtc@vger.kernel.org,
        Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [PATCH v3 1/7] dt-bindings: atmel-tcb: remove wildcard
Message-ID: <20200114232648.GA16276@bogus>
References: <1578997397-23165-1-git-send-email-claudiu.beznea@microchip.com>
 <1578997397-23165-2-git-send-email-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1578997397-23165-2-git-send-email-claudiu.beznea@microchip.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Tue, 14 Jan 2020 12:23:11 +0200, Claudiu Beznea wrote:
> Remove wildcard and use the available compatibles.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
> ---
>  Documentation/devicetree/bindings/mfd/atmel-tcb.txt | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
