Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19A0521DFEC
	for <lists+linux-rtc@lfdr.de>; Mon, 13 Jul 2020 20:39:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726461AbgGMSjI (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 13 Jul 2020 14:39:08 -0400
Received: from mail-il1-f193.google.com ([209.85.166.193]:40830 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726356AbgGMSjI (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 13 Jul 2020 14:39:08 -0400
Received: by mail-il1-f193.google.com with SMTP id e18so12059314ilr.7;
        Mon, 13 Jul 2020 11:39:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HECe1h1n7zCzWXoAPAxcEQontYG7a6arSr+VtGEDhIA=;
        b=a6Z7fYQEgbQ09Ada+OAWb4IJhXnelxj4MQryuA3z38RobU9B3ajTI/9JhJxVQ5NVFd
         VN5w8FY4YR4rFPtzFRXmHgZd2+QNnQNxXVlsvfxOYam34KfF3fTWDVtl3Io8s89krDG/
         0SWCOvNybt2XtFPkopKlh+QTRiLfH12VQoj1tsKM+CQNa+BrU6azmzyzdzsXEXpgYacS
         Xq+y2+fO5UDzTLhi78+Bpgi1SihgZtDpkE241Zj0HW8b8IHgrzP6LBQW9PFb4+/O5j3s
         BhI4wcsdUOY3KzbforkxyRhVenK7YPQGi7zZP5NBrRNJEz/WerBCCKtsY4xbbePQFoQV
         1uNg==
X-Gm-Message-State: AOAM533G/6pkSsDNdxmAAKDx5JunBZGcAcXKY5K/3l12I1hs1gp9vgGn
        xTjZNjtkKxeevujGZ9cAcw==
X-Google-Smtp-Source: ABdhPJwa/uHXheEjPWsBJE2QhRQmFJm7iLz+2dsaMss3v9YJlHcm5TOrp6VlkJ75kLISEcWPHqkWfA==
X-Received: by 2002:a92:dac8:: with SMTP id o8mr1124996ilq.152.1594665547620;
        Mon, 13 Jul 2020 11:39:07 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id e21sm8137455ioe.11.2020.07.13.11.39.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 11:39:07 -0700 (PDT)
Received: (nullmailer pid 513927 invoked by uid 1000);
        Mon, 13 Jul 2020 18:39:06 -0000
Date:   Mon, 13 Jul 2020 12:39:06 -0600
From:   Rob Herring <robh@kernel.org>
To:     "Kevin P. Fleming" <kevin+linux@km6g.us>
Cc:     linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH 1/3 v3] dt-bindings: abx80x: Add autocal-filter property
Message-ID: <20200713183906.GA510880@bogus>
References: <20200615105113.57770-1-kevin+linux@km6g.us>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200615105113.57770-1-kevin+linux@km6g.us>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Mon, Jun 15, 2020 at 06:51:11AM -0400, Kevin P. Fleming wrote:
> Add a property to allow control of the autocalibration filter
> capacitor.
> 
> Signed-off-by: Kevin P. Fleming <kevin+linux@km6g.us>
> Cc: Alessandro Zummo <a.zummo@towertech.it>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> To: linux-rtc@vger.kernel.org
> To: devicetree@vger.kernel.org
> ---
> v3: corrected whitespace
>  Documentation/devicetree/bindings/rtc/abracon,abx80x.txt | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/rtc/abracon,abx80x.txt b/Documentation/devicetree/bindings/rtc/abracon,abx80x.txt
> index 2405e35a1bc0f..1b606e33d1a83 100644
> --- a/Documentation/devicetree/bindings/rtc/abracon,abx80x.txt
> +++ b/Documentation/devicetree/bindings/rtc/abracon,abx80x.txt
> @@ -29,3 +29,11 @@ and valid to enable charging:
>   - "abracon,tc-diode": should be "standard" (0.6V) or "schottky" (0.3V)
>   - "abracon,tc-resistor": should be <0>, <3>, <6> or <11>. 0 disables the output
>                            resistor, the other values are in kOhm.
> +
> +All of the devices can have a 47pf capacitor attached to increase the
> +autocalibration accuracy of their RC oscillators. To enable or disable usage
> +of the capacitor the following property can be defined:
> +
> + - "abracon,autocal-filter": should be <0> or <1>. 0 indicates that there
> +                             is no capacitor attached, 1 indicates that there
> +                             is a capacitor attached.

What does not present mean? If you don't have a defined meaning (such 
as maintain the default/bootloader initialized setting), then make this 
boolean.

Rob
