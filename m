Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 292743AA2C1
	for <lists+linux-rtc@lfdr.de>; Wed, 16 Jun 2021 19:58:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231484AbhFPSAz (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 16 Jun 2021 14:00:55 -0400
Received: from mail-io1-f53.google.com ([209.85.166.53]:47004 "EHLO
        mail-io1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231319AbhFPSAz (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 16 Jun 2021 14:00:55 -0400
Received: by mail-io1-f53.google.com with SMTP id b14so95006iow.13;
        Wed, 16 Jun 2021 10:58:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=lsCEWFAyd6sFNPZrRpU+nHEexyUYwQnz5xbDSvPsuhI=;
        b=AO6pdSddXmcK1oZ58HVLdxykSYyXCBH9dOXqZ4Q34yFwXnhL66YoMZ4IoZmiw4Dfa7
         iwHbBmlpQ8c+KOZoCbRn6a1nhqUPZK6SC7BUabSm/DiyE8qtt5I0LKpH/FTvN/nzUvKH
         Ac7XnTOgPkknYJIXpT35UIbfnTeS5YMg8RnqGOcBJTB0WSnRmYNI1MGMTmMyMAyp3NlU
         2c8l7w8tO8zYiMu+YEny0eLe0p7Ljk+ntc41r4FENKm63wcefn+E1I+hMlB/qISWGvpE
         LGLLCzndhIo0EnCiscStC1/nmJzIhhCzM1t6YmS7Cj5s7CZOGWOFHDpXVAT+hSNyun/k
         Jecg==
X-Gm-Message-State: AOAM533jmOiz9Wvn12BKGN6J49nePZyaJBqrlgFmoxqm4PjUp75pnS7M
        ZbzUmKUzxQaaZFHhfbap3bpRUS7R1A==
X-Google-Smtp-Source: ABdhPJzn08JzGsjEi40/SYzXj8xShFLKLTEpIMTpSU6Rgkq5EV0d4J2gm0PPgcQ/RXte6fqQhMts+A==
X-Received: by 2002:a6b:b554:: with SMTP id e81mr482359iof.163.1623866327443;
        Wed, 16 Jun 2021 10:58:47 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id n20sm1526418ioo.23.2021.06.16.10.58.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jun 2021 10:58:46 -0700 (PDT)
Received: (nullmailer pid 3619554 invoked by uid 1000);
        Wed, 16 Jun 2021 17:58:44 -0000
Date:   Wed, 16 Jun 2021 11:58:44 -0600
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-rtc@vger.kernel.org, Biju Das <biju.das@bp.renesas.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Eric Nelson <eric@nelint.com>, devicetree@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: rtc: nxp,pcf8563: Absorb pcf85263/pcf85363
 bindings
Message-ID: <20210616175844.GA3619453@robh.at.kernel.org>
References: <e4f48d97f0e16d78a796f02b77ea3a0018904185.1623416431.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e4f48d97f0e16d78a796f02b77ea3a0018904185.1623416431.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Fri, 11 Jun 2021 15:01:45 +0200, Geert Uytterhoeven wrote:
> The NXP PCF85263/PCF85363 Real Time Clock is very similar to the NXP
> PCF8563.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  .../devicetree/bindings/rtc/nxp,pcf8563.yaml    |  4 +++-
>  .../devicetree/bindings/rtc/pcf85363.txt        | 17 -----------------
>  2 files changed, 3 insertions(+), 18 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/rtc/pcf85363.txt
> 

Applied, thanks!
