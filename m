Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B617B139D78
	for <lists+linux-rtc@lfdr.de>; Tue, 14 Jan 2020 00:40:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729137AbgAMXkg (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 13 Jan 2020 18:40:36 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:44003 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727382AbgAMXkf (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 13 Jan 2020 18:40:35 -0500
Received: by mail-oi1-f194.google.com with SMTP id p125so10058036oif.10
        for <linux-rtc@vger.kernel.org>; Mon, 13 Jan 2020 15:40:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=F2iDZ52lWikDVmU5g/bwIONEfUCTF197jf9k+MTeRXI=;
        b=P+RKL6Cjztq/iEkqF04kWNk4PAI2Mtc/bi+w0Go2f3AJJUNBp0/SoLYqGEqMXaWVWa
         XFsLIgX0HGaS+KSjEQyk0QxQQ0xJRVno+f16hwW/2RNysTdAGhKMN6GW4/g+ODqCem/g
         rXDJMnI2skR82h/Bx8pEXTnd+CoOWl7f+urWlLlLKPCaWOk6l+0I5lD88RbvJnc7wbKD
         t52pQbDGp/Y0jKzrcX3kTkxoxp3raUibT0ILjfhAx3UjpqQWTf0jB2lOnRN0ifLXlRfk
         /I3KneJbeVNEPUxviw3kzMOQE7DQjucF3i9cmZkQ0NfDYvK95YOqe4rtstETyrq7vxZH
         HgQA==
X-Gm-Message-State: APjAAAV3s9YJtbLpoPgfhBMf2we/tR6WvvygcTF0mjdc2IC/maANLJU8
        C96Ya2cDs9g2aoXfuy54/JC7Lqk=
X-Google-Smtp-Source: APXvYqzmlSOZwPaEfNIYLAN/PoeBi8LRagCL1j4jEiGsY15RmZyj2cdp6rjsm00VcMZiUZ6dBLtuNg==
X-Received: by 2002:a05:6808:9a4:: with SMTP id e4mr14912743oig.127.1578958834841;
        Mon, 13 Jan 2020 15:40:34 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id d17sm3407649otf.35.2020.01.13.15.40.34
        for <linux-rtc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2020 15:40:34 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 220b00
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Mon, 13 Jan 2020 17:22:57 -0600
Date:   Mon, 13 Jan 2020 17:22:57 -0600
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
Subject: Re: [PATCH v2 01/17] dt-bindings: at_xdmac: remove wildcard
Message-ID: <20200113232257.GA30124@bogus>
References: <1578673089-3484-1-git-send-email-claudiu.beznea@microchip.com>
 <1578673089-3484-2-git-send-email-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1578673089-3484-2-git-send-email-claudiu.beznea@microchip.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Fri, 10 Jan 2020 18:17:53 +0200, Claudiu Beznea wrote:
> Remove wildcard and use the available compatible.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
> ---
>  Documentation/devicetree/bindings/dma/atmel-xdma.txt | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
