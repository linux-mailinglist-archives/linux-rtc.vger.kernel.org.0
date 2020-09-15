Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2EA126B0DF
	for <lists+linux-rtc@lfdr.de>; Wed, 16 Sep 2020 00:21:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726320AbgIOQ2J (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 15 Sep 2020 12:28:09 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:46141 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727654AbgIOQ10 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 15 Sep 2020 12:27:26 -0400
Received: by mail-pf1-f193.google.com with SMTP id b124so2207777pfg.13;
        Tue, 15 Sep 2020 09:27:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=SsVoyaohphvNmpQfLIGvw8atCfZJJYkBmuyLFwxaxxU=;
        b=NJp9hZd3YCnoybrYWHU8x3pwmvcVGFn57lpzadtIY60Ket/IqbYbDScBlZacYAtMx0
         oDJBikgrnMbi4R25bbsc+K3lE5xBEEgsu0maeN5ytIAfO6zamDoaq5ymGpfvzG28comf
         qOt49wXW0QwKYuqq9LMkKeN4tFx6hWb6FI6IDG4DHUDZSBgVAzFp8df5zNVlZLL/0s1g
         2B8Kp6BxoU8TZ8tZ5dI92o+sjmm7WmEkmdk8DUggjz/L49dgcJO42YKmtX74eYLZPQ4/
         jj8E9CUCuuZYdhL8QmXFr6AznSiNsqDdZRULIbSMSHzImYQ2tgsdGjnHJmOfE2SXHhha
         2clg==
X-Gm-Message-State: AOAM531W6298QVL3E2nTycoNiqzQrzUlr0+x9xYBNjYIRvFoLbaVa/oy
        XY+W5WkV1ra4p0gOfeQAZL3WF2OcmK9aEqU=
X-Google-Smtp-Source: ABdhPJw1S9izW5NuOehAS0M2hJEo32O1xoYyF7kK+wWcApEGAPOkeIQBfam1oa9JFXb7qyeJiJLU0g==
X-Received: by 2002:a92:8517:: with SMTP id f23mr17420789ilh.45.1600185630800;
        Tue, 15 Sep 2020 09:00:30 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id l10sm2784821ilm.75.2020.09.15.09.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2020 09:00:30 -0700 (PDT)
Received: (nullmailer pid 2028536 invoked by uid 1000);
        Tue, 15 Sep 2020 16:00:27 -0000
Date:   Tue, 15 Sep 2020 10:00:27 -0600
From:   Rob Herring <robh@kernel.org>
To:     Bastian Krause <bst@pengutronix.de>
Cc:     Arnaud Ebalard <arno@natisbad.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Marek Vasut <marex@denx.de>, kernel@pengutronix.de,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 2/8] dt-bindings: rtc: ds1307: let aux-voltage-chargeable
 supersede trickle-diode-disable
Message-ID: <20200915160027.GA2028477@bogus>
References: <20200907142727.26472-1-bst@pengutronix.de>
 <20200907142727.26472-3-bst@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200907142727.26472-3-bst@pengutronix.de>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Mon, 07 Sep 2020 16:27:21 +0200, Bastian Krause wrote:
> trickle-diode-disable is deprecated, so reflect that in the driver's
> binding and add the new aux-voltage-chargeable.
> 
> Signed-off-by: Bastian Krause <bst@pengutronix.de>
> ---
> Previous version:
> https://lore.kernel.org/linux-rtc/20200415163701.21989-2-bst@pengutronix.de/
> ---
>  Documentation/devicetree/bindings/rtc/rtc-ds1307.txt | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
