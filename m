Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C06C262DDD
	for <lists+linux-rtc@lfdr.de>; Tue,  9 Jul 2019 04:07:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726945AbfGICHN (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 8 Jul 2019 22:07:13 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:44246 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726302AbfGICHM (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 8 Jul 2019 22:07:12 -0400
Received: by mail-io1-f68.google.com with SMTP id s7so39741743iob.11;
        Mon, 08 Jul 2019 19:07:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Nvxsvabibeqxj9WUVv6Z6wvH54INJItCE0z4PDaTAJQ=;
        b=inUnYnMgwQ4FdxY/gYW365CzMraj015L/4Roy4UA6bBrJHv5956my6iQQtd89KLHpp
         jyQ3QYQ2nY3q+sflpiB2Gw9ctD9zfCXsyiZ4av0sHVkw8YXGxwWCZ3PNtEY4uOq1RfTg
         E1RAowPjWQtMzOFrnrmN6KafCsYkdlimCbA4VHXCa/UH2Zyqjf9QydcuwTLiwW9wY1BW
         wrgLgNzn2gTIc25dwbm/VnBUcBJPC26tz8TZnlhzaT3C94TV8sUTYBvskmAR2aFTrAzs
         +OZoxQWLdR3mwtQu/JH9Me7XQsGwFfuof9k/eoEm+eSBrT824eHdUgr6jV1MGLPKYDWf
         9ZUQ==
X-Gm-Message-State: APjAAAUa6nf6F4VBjOT1jNcLd+WBt3Ie/B6r9Ce4+H9rR0SIlHJyWeF1
        F81zjmLKlZCZoE+vog4t9g==
X-Google-Smtp-Source: APXvYqwfzxJ6xSu2EIIO/95/HygSxORJzSJG1gfO/d33GQTG9fARJwluwHZxXHyRGhhSvqjfx0NCRQ==
X-Received: by 2002:a02:c487:: with SMTP id t7mr22907623jam.99.1562638031844;
        Mon, 08 Jul 2019 19:07:11 -0700 (PDT)
Received: from localhost ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id f20sm17526029ioh.17.2019.07.08.19.07.10
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 08 Jul 2019 19:07:11 -0700 (PDT)
Date:   Mon, 8 Jul 2019 20:07:09 -0600
From:   Rob Herring <robh@kernel.org>
To:     Kevin Hilman <khilman@kernel.org>
Cc:     linux-rtc@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH 1/2] dt-bindings: rtc: new binding for Amlogic VRTC
Message-ID: <20190709020709.GA20395@bogus>
References: <20190607194343.18359-1-khilman@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190607194343.18359-1-khilman@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Fri,  7 Jun 2019 12:43:42 -0700, Kevin Hilman wrote:
> From: Kevin Hilman <khilman@baylibre.com>
> 
> Add binding fo the new VRTC driver for Amlogic SoCs.  The 64-bit
> family of SoCs only has an RTC managed by firmware, and this VRTC
> driver provides the simple, one-register firmware interface.
> 
> Signed-off-by: Kevin Hilman <khilman@baylibre.com>
> ---
>  .../devicetree/bindings/rtc/rtc-meson-vrtc.txt   | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rtc/rtc-meson-vrtc.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
