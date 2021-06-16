Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BBA63AA4A4
	for <lists+linux-rtc@lfdr.de>; Wed, 16 Jun 2021 21:51:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232199AbhFPTxu (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 16 Jun 2021 15:53:50 -0400
Received: from mail-io1-f49.google.com ([209.85.166.49]:34720 "EHLO
        mail-io1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230330AbhFPTxt (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 16 Jun 2021 15:53:49 -0400
Received: by mail-io1-f49.google.com with SMTP id 5so510888ioe.1;
        Wed, 16 Jun 2021 12:51:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=yAXx4Yopw3r7pNvhfDacMKh0R4jB110M44nYaT+APq8=;
        b=PetY5yG8zZak3nlSWbFpGoRLWDvTUT3m8pJBDK+/BiXjv36xEvRyOpLJG6p5/DXq3P
         4o5XmIoFCGubPZMkAmNGLxsaKIWlq/rAkUCdCHP7aHbzVaBQmAGEu9O0pN8thDHBD6yy
         UZlL81KaFXI/Jhjb/DcfZx/IV3Q9s8S3qVuJofiyebYC0USiDG0MIUm1vVK9CWS6RMGB
         JTB6Suvi++KaO/MNGAWtHdlKJAA3Qr4m4I6ddB6RX5gDhNwRWhIsU+5ki6D/knRMaZyx
         elczHFMEGZzL7BdxpBfjfhTKIPSs0PP01Gj4j+VQF2pllO65nts+YLAcCCFXXkRTJAUl
         fQIA==
X-Gm-Message-State: AOAM530Cd2fqTXhqI77tp0eLr3IQ2UwOFdpcWarpa3VAQUCj6C5XlWO0
        F7PmDsx2xKrpNU0scwEdsg==
X-Google-Smtp-Source: ABdhPJyX6BfPXir16dVhawr9dvOqj80SsmOX4PTfx6pfj5l1Q8ml1djko9j3NoR3WeeFwv2mc3wTiQ==
X-Received: by 2002:a6b:f914:: with SMTP id j20mr768281iog.127.1623873102310;
        Wed, 16 Jun 2021 12:51:42 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id o10sm1610031ilc.75.2021.06.16.12.51.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jun 2021 12:51:41 -0700 (PDT)
Received: (nullmailer pid 3828441 invoked by uid 1000);
        Wed, 16 Jun 2021 19:51:37 -0000
Date:   Wed, 16 Jun 2021 13:51:37 -0600
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-renesas-soc@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH] dt-bindings: rtc: ti,bq32k: Convert to json-schema
Message-ID: <20210616195137.GA3828379@robh.at.kernel.org>
References: <42d9c71b4ee1f120e0cdcf6b266547d29d1fb9a4.1623851377.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <42d9c71b4ee1f120e0cdcf6b266547d29d1fb9a4.1623851377.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Wed, 16 Jun 2021 15:51:43 +0200, Geert Uytterhoeven wrote:
> Convert the TI BQ32000 I2C Serial Real-Time Clock Device Tree binding
> documentation to json-schema.
> 
> Document missing properties.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  .../devicetree/bindings/rtc/ti,bq32000.yaml   | 49 +++++++++++++++++++
>  .../devicetree/bindings/rtc/ti,bq32k.txt      | 18 -------
>  2 files changed, 49 insertions(+), 18 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/rtc/ti,bq32000.yaml
>  delete mode 100644 Documentation/devicetree/bindings/rtc/ti,bq32k.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
