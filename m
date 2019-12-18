Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 394C91253EF
	for <lists+linux-rtc@lfdr.de>; Wed, 18 Dec 2019 21:55:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727145AbfLRUzA (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 18 Dec 2019 15:55:00 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:37930 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726454AbfLRUzA (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 18 Dec 2019 15:55:00 -0500
Received: by mail-oi1-f196.google.com with SMTP id b8so1896820oiy.5;
        Wed, 18 Dec 2019 12:54:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=3WrEt8H51i2MAiopdANXZZmd/Mt74MDOWginm3lANHg=;
        b=EM2o9qt0xXohUO5n1u8Y6M/WlBPaY3f647W1nTn2Xup/A3K7Hw/qFxmqJjBVLXmFqa
         IszjN+jGjvIPj/8U3BtCKZVjDe3sx3hOdjVr/tFyEzJJC9FGBkZvW4ZJZUWcR26kS6Vr
         eLG7TBJk/svj5Dd16W5E6PMbZH6z9yE5vgT33N+zffOvMCUMyHgcwN0jL4c98HJs72cV
         l4d3QatbUu6tQCG6UqA8WfqAE2DoT/eSaVCtxP6IIxyGtBNELI/780X4OFpyNl8UxpMQ
         qL0MHZ2cYPQKiNb3Mfd8CJVXfTKuD9lmxnAWWVO2hmquH+gGrlh/xf3LGcT0zTFRh8uZ
         fNhg==
X-Gm-Message-State: APjAAAWYnuB/ZzwB1ikxt/LE2RQH2KA5nyPxZ/VgXhjZ1bNsZApW+Z+K
        I/8xK9kmmC2nAbLeb+dH8Q==
X-Google-Smtp-Source: APXvYqz5U1NOEkDz/LnoLUN5AC8nqzd+VCSzJ3WpZFmtuajw9UW7Pw7roEW/gUclQlpON5eZlxoBUw==
X-Received: by 2002:aca:cf11:: with SMTP id f17mr1457488oig.40.1576702499075;
        Wed, 18 Dec 2019 12:54:59 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id w12sm1196571otk.75.2019.12.18.12.54.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2019 12:54:58 -0800 (PST)
Date:   Wed, 18 Dec 2019 14:54:57 -0600
From:   Rob Herring <robh@kernel.org>
To:     Andreas Kemnade <andreas@kemnade.info>
Cc:     lee.jones@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com,
        a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rtc@vger.kernel.org, stefan@agner.ch, b.galvani@gmail.com,
        phh@phh.me, letux-kernel@openphoenux.org,
        Andreas Kemnade <andreas@kemnade.info>
Subject: Re: [PATCH v4 1/5] dt-bindings: mfd: rn5t618: Document optional
 property interrupts
Message-ID: <20191218205457.GA4963@bogus>
References: <20191211215409.32764-1-andreas@kemnade.info>
 <20191211215409.32764-2-andreas@kemnade.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191211215409.32764-2-andreas@kemnade.info>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Wed, 11 Dec 2019 22:54:05 +0100, Andreas Kemnade wrote:
> These chips use interrupts for various things like RTC alarm.
> 
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---
> Changes in v4: add refernce to interrupt binding
> documentation
>  Documentation/devicetree/bindings/mfd/rn5t618.txt | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
