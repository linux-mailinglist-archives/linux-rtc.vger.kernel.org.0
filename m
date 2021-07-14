Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E3933C9448
	for <lists+linux-rtc@lfdr.de>; Thu, 15 Jul 2021 01:15:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231301AbhGNXSo (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 14 Jul 2021 19:18:44 -0400
Received: from mail-il1-f178.google.com ([209.85.166.178]:42741 "EHLO
        mail-il1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230478AbhGNXSn (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 14 Jul 2021 19:18:43 -0400
Received: by mail-il1-f178.google.com with SMTP id h3so3239596ilc.9;
        Wed, 14 Jul 2021 16:15:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BYSXQ7n1DwSUA9CRKZRWNODD9r+oXjD7cGdzNttzqVY=;
        b=nIAm+sZaK+GBzbLWgtJRdvFsdnnviexQTonsvh7HYU3Hu2wGH495QO40V9/zJ6vpWd
         5S/B92ld/UVxSJlLJ4S48pQWs26JtvWRTYiEcdM1W6KoANvFX1/l39Tx76uebce+lLTf
         LdJxQSd2iat2GuYt8eU0SDMovZHqM2/6Fjf+yiJmv7dr4d/A8a/ETbroyeZXScYSmso9
         iTPtptHgxi8itm3AUPZ3cn+wMwX65VAcP00KF7e0rs5ykQIxdGgryFnO8/lIlLCrFM+d
         p1VzEBRPkqNoddlHEMg4HP62owGPw6/qakaRDLlRvdfly+MAnFk5P8ed7rRM0pXJkClM
         oM6w==
X-Gm-Message-State: AOAM532VEcSIMpzIUL89LAiXAAFX5m7F/GslTGJ2Wtfomkyn4rmNJvod
        gv2e8IW0xaVV8kQ2396yNw==
X-Google-Smtp-Source: ABdhPJx6n1nDiSad8U3YCLxAlY/YvVr/2Z7+rB7oSFNpxeQts/I2soiVH8fs9zFpcSBH994TpPr/tQ==
X-Received: by 2002:a92:b50d:: with SMTP id f13mr120590ile.253.1626304551426;
        Wed, 14 Jul 2021 16:15:51 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id q186sm2153093ioq.1.2021.07.14.16.15.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 16:15:50 -0700 (PDT)
Received: (nullmailer pid 3723139 invoked by uid 1000);
        Wed, 14 Jul 2021 23:15:48 -0000
Date:   Wed, 14 Jul 2021 17:15:48 -0600
From:   Rob Herring <robh@kernel.org>
To:     Mathew McBride <matt@traverse.com.au>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/2] dt-bindings: rtc: add Epson RX-8025 and RX-8035
Message-ID: <20210714231548.GA3723080@robh.at.kernel.org>
References: <20210709044518.28769-1-matt@traverse.com.au>
 <20210709044518.28769-3-matt@traverse.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210709044518.28769-3-matt@traverse.com.au>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Fri, 09 Jul 2021 04:45:18 +0000, Mathew McBride wrote:
> These are supported by the rtc-rx8025 module. RX-8025
> also has support in ds1307 due to compatible time registers.
> 
> Signed-off-by: Mathew McBride <matt@traverse.com.au>
> ---
>  Documentation/devicetree/bindings/rtc/trivial-rtc.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
