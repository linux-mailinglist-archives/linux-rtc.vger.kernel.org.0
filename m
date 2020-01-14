Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 573C5139DFA
	for <lists+linux-rtc@lfdr.de>; Tue, 14 Jan 2020 01:20:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728865AbgANAUX (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 13 Jan 2020 19:20:23 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:34094 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728783AbgANAUW (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 13 Jan 2020 19:20:22 -0500
Received: by mail-oi1-f195.google.com with SMTP id l136so10194102oig.1
        for <linux-rtc@vger.kernel.org>; Mon, 13 Jan 2020 16:20:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=PuZkmizV0FjMntSV+5swUbzzYgbKg4dX9XcvnF9x9qQ=;
        b=qsXMDq5vymMypzI4mo449Hc6prQA0OgE4vS7Z/9DrRtFfiefp0bXW7GkKstnU1PhuI
         ixKo54S/x4xmvRnLuoHuib/8dxg9pi1gO9aOchfbBhNDJJR7Y0agUbm0iCqhd6CVFF3a
         MkjCqfuJARzKOgfIJbNmOLFyyejB5Lv4o8ONb1dfr+R5iK0SnxbiIeTciEF79emJunEJ
         MawouJBWVn2rS/iHLkgQOqGvn7rfHbNjY+pb6AuytzwGiNCD0xjj2c9JT6GjQuRrHLLO
         xkpRP9aADN6rYQc1X2Nf2ixX8a66/7YctePk9CDYY41QKjEF7YY5FkIoqinR/uL02q+j
         +1vA==
X-Gm-Message-State: APjAAAX7ICMFbzo215YhXEJJ3o84Y1S4bVhsj64La3zicEeC1U64WdxV
        PICLUoBj5sDON56tXz3QMEr6CeVZIw==
X-Google-Smtp-Source: APXvYqzHHCaF3QMpK5V9SIfxyXcL85i4EV8lVUylh77NZYQ5Uh0PPunLbctWp60SxZyUdOJlKDNFjw==
X-Received: by 2002:aca:554d:: with SMTP id j74mr15209538oib.92.1578961220872;
        Mon, 13 Jan 2020 16:20:20 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id z17sm4740595otk.3.2020.01.13.16.20.19
        for <linux-rtc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2020 16:20:19 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 223d55
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Mon, 13 Jan 2020 18:17:17 -0600
Date:   Mon, 13 Jan 2020 18:17:17 -0600
From:   Rob Herring <robh@kernel.org>
To:     Claudiu Beznea <claudiu.beznea@microchip.com>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com,
        nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
        ludovic.desroches@microchip.com, vkoul@kernel.org,
        eugen.hristev@microchip.com, jic23@kernel.org, knaack.h@gmx.de,
        lars@metafoo.de, pmeerw@pmeerw.net, mchehab@kernel.org,
        lee.jones@linaro.org, radu_nicolae.pirea@upb.ro,
        richard.genoud@gmail.com, tudor.ambarus@microchip.com,
        miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
        wg@grandegger.com, mkl@pengutronix.de, a.zummo@towertech.it,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-iio@vger.kernel.org, linux-media@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-can@vger.kernel.org, linux-rtc@vger.kernel.org,
        Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [PATCH v2 09/17] dt-bindings: atmel-sysreg: add
 microchip,sam9x60-ddramc
Message-ID: <20200114001717.GA11996@bogus>
References: <1578673089-3484-1-git-send-email-claudiu.beznea@microchip.com>
 <1578673089-3484-10-git-send-email-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1578673089-3484-10-git-send-email-claudiu.beznea@microchip.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Fri, 10 Jan 2020 18:18:01 +0200, Claudiu Beznea wrote:
> Add microchip,sam9x60-ddramc to DT bindings documentation.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
> ---
>  Documentation/devicetree/bindings/arm/atmel-sysregs.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
