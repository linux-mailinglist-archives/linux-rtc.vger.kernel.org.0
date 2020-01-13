Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3819139DB8
	for <lists+linux-rtc@lfdr.de>; Tue, 14 Jan 2020 01:00:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729074AbgANAAG (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 13 Jan 2020 19:00:06 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:36015 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729030AbgANAAG (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 13 Jan 2020 19:00:06 -0500
Received: by mail-oi1-f193.google.com with SMTP id c16so10141159oic.3
        for <linux-rtc@vger.kernel.org>; Mon, 13 Jan 2020 16:00:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=7d1TijNzzm5olBqQ6BOPTTjVLO96fK38vWoVBLQU76w=;
        b=SDgipeZao8kBF8J3RemO7HnlGHf1Gq68yJTBxGbi36/9OO3Lxh1MBoiTN9PvkwMxwV
         Qv9cM8gR7h0l7+8MWZRFvDnsQ4TitIQ7ZrqC71vICun8tkCnpUHNqHYRYlLBV/E6ZHRB
         Hf4GG/8XpNacpwEephZu3HCUQmazkgqfAgE/C3INksOmdj9BtIvHcDcjhcE7j6kPKBxP
         FiMpuynufATkCi0DJg7F55/zErsOAwDQaMvPCr7pWA5HcDdLgtEzVkBRJwpAEJQU5eR1
         MolSruP+l4kyrQQw/mmDiiuoOfYxRmlr9ljS3llnslFFMloHO+PbbNgN5okfyunieOOD
         /dYQ==
X-Gm-Message-State: APjAAAVKc88B8UTcoGNWRVKofJhQXs7yr0w4QlUl1LmHflyjC44UATl7
        /fmGHWhFEFeHQ1F8XjB3E88DxpNhng==
X-Google-Smtp-Source: APXvYqyv8CGl0zuEWChwsN5fYE9JsP+X247c2e5l9AgLB4c3e2xNMKESiezowuXVNRC6NCUr9e8gtA==
X-Received: by 2002:aca:568f:: with SMTP id k137mr15039263oib.63.1578960004839;
        Mon, 13 Jan 2020 16:00:04 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id r63sm3990825oib.56.2020.01.13.16.00.02
        for <linux-rtc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2020 16:00:04 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 2219d0
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Mon, 13 Jan 2020 17:23:10 -0600
Date:   Mon, 13 Jan 2020 17:23:10 -0600
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
Subject: Re: [PATCH v2 02/17] dt-bindings: at_xdmac: add microchip,sam9x60-dma
Message-ID: <20200113232310.GA30698@bogus>
References: <1578673089-3484-1-git-send-email-claudiu.beznea@microchip.com>
 <1578673089-3484-3-git-send-email-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1578673089-3484-3-git-send-email-claudiu.beznea@microchip.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Fri, 10 Jan 2020 18:17:54 +0200, Claudiu Beznea wrote:
> Add microchip,sam9x60-dma to DT bindings documentation.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
> ---
>  Documentation/devicetree/bindings/dma/atmel-xdma.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
