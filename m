Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6128226B0A4
	for <lists+linux-rtc@lfdr.de>; Wed, 16 Sep 2020 00:16:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727741AbgIOWQw (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 15 Sep 2020 18:16:52 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:38894 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727738AbgIOQep (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 15 Sep 2020 12:34:45 -0400
Received: by mail-pg1-f195.google.com with SMTP id l191so2271553pgd.5;
        Tue, 15 Sep 2020 09:34:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=D8Xp4X70lCVnbikPD4IS/Q9qvm//e/pK0MIg9WYPoV4=;
        b=c6QDuPRItwT9XF0PxYSvQDgXUkNx9iwVjfts2njsIoo1uDejvjxuwHg3eT2Nu15OFf
         d35pZD111+eEQdj7IJhyWUWc4LB6HDBVF9boYy6wdWOEMynu04WpjIXn6mLrQtLceD68
         7sE/M7EKy4blTTMpicnX2svtnokgj6d7bzmMZ3IxRIryKgGIeN662/4IrZ4XE7dLFxdF
         ewUYGC32W6FIHAtk1aNfTyuevZ79CxIv3ohatX2Bkkgl/EKYwhAQwYcsloYlF5J47xsD
         OAFe/MfvsVgG3M///0FsPVZa0iDAea62xLHjDywdzGbR1TxGfvWdlGmVuVqcUxw/UDcB
         Rp/Q==
X-Gm-Message-State: AOAM532PuMJpf7TcRXZ/H+Yb/YK54isM9r4Y2QDHPl9Jpb1T02rNmB/7
        suHRQOs76SjeVN9jHKL1oBslH43nviQVsT0=
X-Google-Smtp-Source: ABdhPJwIpZq4Nfltr6nwrfhRg0vZRtEYrplJotNegBqzmwiLLQRUQ2+/+8lZ9CfHi9dPkQVJROfPEQ==
X-Received: by 2002:a92:9a92:: with SMTP id c18mr17195402ill.293.1600185658609;
        Tue, 15 Sep 2020 09:00:58 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id y19sm8793490ili.47.2020.09.15.09.00.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2020 09:00:57 -0700 (PDT)
Received: (nullmailer pid 2029356 invoked by uid 1000);
        Tue, 15 Sep 2020 16:00:55 -0000
Date:   Tue, 15 Sep 2020 10:00:55 -0600
From:   Rob Herring <robh@kernel.org>
To:     Bastian Krause <bst@pengutronix.de>
Cc:     Marek Vasut <marex@denx.de>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        kernel@pengutronix.de, Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        Arnaud Ebalard <arno@natisbad.org>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 3/8] dt-bindings: rtc: ds1307: add rx8130
 aux-voltage-chargeable support
Message-ID: <20200915160055.GA2029301@bogus>
References: <20200907142727.26472-1-bst@pengutronix.de>
 <20200907142727.26472-4-bst@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200907142727.26472-4-bst@pengutronix.de>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Mon, 07 Sep 2020 16:27:22 +0200, Bastian Krause wrote:
> Epson's RX8130 was not charged before. A related patch will allow
> optional charging.
> 
> Signed-off-by: Bastian Krause <bst@pengutronix.de>
> ---
> Previous version:
> https://lore.kernel.org/linux-rtc/20200415163701.21989-2-bst@pengutronix.de/
> ---
>  Documentation/devicetree/bindings/rtc/rtc-ds1307.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
