Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCC1C42165F
	for <lists+linux-rtc@lfdr.de>; Mon,  4 Oct 2021 20:26:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238063AbhJDS17 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 4 Oct 2021 14:27:59 -0400
Received: from mail-ot1-f54.google.com ([209.85.210.54]:46954 "EHLO
        mail-ot1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234497AbhJDS17 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 4 Oct 2021 14:27:59 -0400
Received: by mail-ot1-f54.google.com with SMTP id o59-20020a9d2241000000b0054745f28c69so22710794ota.13;
        Mon, 04 Oct 2021 11:26:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=o8bwhkN79EalIrTbnnOWRqEA3DSi10UHvsR2eJcQa94=;
        b=VX2GazQ7k2Feaf7Yd9RSRX0VUasnGDpItuUIKSofp9cNqs88YA6MzlaKq19hoq0oso
         faOpDuRAu3cHWXElrisTuOZTViDXYfzdiZWAP9cbRinnzueKbaibz5JoGgvo6V/OMGBR
         Wn+5SJGTAm1787SAX4Q/7ag7zk3561LRQjS0+LKOH8A7+OMEnbGL9ghbE4Fer6KagZVs
         hUzjIfFxQzlbRAKbTfEoX2ftQ7zBOj2O0emvu6lgWWuS9XXMZBEawm0CjkFjNLqCVZgc
         HuTXdhi7UMf59Ni1pxKvivUQ6XLflfr/ay6w05nNEIPSukpHM3c2142kVM7GiDuTeWQN
         jsuA==
X-Gm-Message-State: AOAM533anNfDOkN5dGGVHuD+e5l2pIPa+LvLHfbi40ByIMRmCj4q5c/v
        RHDI3o4KWNhU4G2Ronzyhg==
X-Google-Smtp-Source: ABdhPJz2K7KCGZfqZNBbWPfWIgbCS+HZoWQP3+s7HnKACw+3nQsHcrlj9kQ5sRUN6acBuzNlHkKtng==
X-Received: by 2002:a05:6830:1616:: with SMTP id g22mr10744306otr.79.1633371969600;
        Mon, 04 Oct 2021 11:26:09 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id j24sm2186115otq.72.2021.10.04.11.26.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 11:26:09 -0700 (PDT)
Received: (nullmailer pid 1608195 invoked by uid 1000);
        Mon, 04 Oct 2021 18:26:08 -0000
Date:   Mon, 4 Oct 2021 13:26:08 -0500
From:   Rob Herring <robh@kernel.org>
To:     Samuel Holland <samuel@sholland.org>
Cc:     linux-arm-kernel@lists.infradead.org,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        devicetree@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        Maxime Ripard <mripard@kernel.org>, linux-rtc@vger.kernel.org,
        linux-sunxi@lists.linux.dev, Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org,
        Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH v2 1/9] dt-bindings: rtc: sun6i: Clean up repetition
Message-ID: <YVtHQMMzPn00tLDw@robh.at.kernel.org>
References: <20210928080335.36706-1-samuel@sholland.org>
 <20210928080335.36706-2-samuel@sholland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210928080335.36706-2-samuel@sholland.org>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Tue, 28 Sep 2021 03:03:27 -0500, Samuel Holland wrote:
> - Use "enum" for compatibles instead of several "const" alternatives.
> - Merge the H6 clock-output-names minItems/maxItems constraint into the
>   identical block above.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
> Changes since v1:
>   - New patch.
> 
>  .../bindings/rtc/allwinner,sun6i-a31-rtc.yaml | 28 ++++++-------------
>  1 file changed, 9 insertions(+), 19 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
