Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 794862BDE2
	for <lists+linux-rtc@lfdr.de>; Tue, 28 May 2019 05:46:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727591AbfE1DqG (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 27 May 2019 23:46:06 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:42864 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727386AbfE1DqG (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 27 May 2019 23:46:06 -0400
Received: by mail-ed1-f67.google.com with SMTP id g24so1592074eds.9;
        Mon, 27 May 2019 20:46:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4SEwU4Hy3cIfuDLFnw9kA0Guwr5r77r5h+wWMUlBBnA=;
        b=N48U9UORR4Q5p2rGNceW2Xo1b3g2u5Dr5V7Ldg7sulDfEMXiGBEg/WsysJ3AVrTOgI
         EMphSU0fFrslhQi6zBaNa+TQk2mWJ6c3haLwh7uwaI0XwfK+ABloTFmUwCtKOvR8qMvm
         xc9gWBFDwS6Xj/TlJ0XtJvRE5SMnl5w7TO7+wBrHoAhZFlqE7JgrBUS1cdt/K3HeDuZu
         b9SrllHf7m/OHm9NYXoU+QYTB/436/Z2YlkzWDpxKzjdFnLayUO3N1F/isyPZP24nzxn
         TdEQnDMW04FTTtjdYRpJCGx5wLWuwF0DFM9kWb2x6d0+RrmAmJoSL0NIZCxyHzD1B24Y
         yw+w==
X-Gm-Message-State: APjAAAWZwpzJvh7cFKyL4j3QwXfFTo8IPICVFrXot6+fy/P16EH2qzjm
        X9kI7wLEhGErps4ZIpZg5LPyyS3A4ZU=
X-Google-Smtp-Source: APXvYqxzqgplYkfl2iQpuNshJLrbM5BH099UYvbIAnw7MbwiG0EkuKdaRNPonW+wkZjc+0w1sbSKOg==
X-Received: by 2002:a17:906:5d12:: with SMTP id g18mr87145155ejt.286.1559015164739;
        Mon, 27 May 2019 20:46:04 -0700 (PDT)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com. [209.85.221.45])
        by smtp.gmail.com with ESMTPSA id l5sm3829173edb.50.2019.05.27.20.46.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 May 2019 20:46:04 -0700 (PDT)
Received: by mail-wr1-f45.google.com with SMTP id s17so18548313wru.3;
        Mon, 27 May 2019 20:46:04 -0700 (PDT)
X-Received: by 2002:adf:9c8a:: with SMTP id d10mr23572420wre.9.1559015164084;
 Mon, 27 May 2019 20:46:04 -0700 (PDT)
MIME-Version: 1.0
References: <290402405a34506997fd2fab2c4c1486dbe6b7e5.1558958381.git-series.maxime.ripard@bootlin.com>
 <8be02c659fe4191dbf1d3c8dcb1ded8ff92e2dda.1558958381.git-series.maxime.ripard@bootlin.com>
In-Reply-To: <8be02c659fe4191dbf1d3c8dcb1ded8ff92e2dda.1558958381.git-series.maxime.ripard@bootlin.com>
From:   Chen-Yu Tsai <wens@csie.org>
Date:   Tue, 28 May 2019 11:45:54 +0800
X-Gmail-Original-Message-ID: <CAGb2v66M=VWdN-MTAe3qN1B8vwNHjfN5jwjzZBkqiCh7xTvnzQ@mail.gmail.com>
Message-ID: <CAGb2v66M=VWdN-MTAe3qN1B8vwNHjfN5jwjzZBkqiCh7xTvnzQ@mail.gmail.com>
Subject: Re: [PATCH 05/10] dt-bindings: rtc: sun6i: Add the R40 RTC compatible
To:     Maxime Ripard <maxime.ripard@bootlin.com>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Mon, May 27, 2019 at 8:01 PM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
>
> The R40 has a pretty different RTC compared to the other SoCs we've
> encountered so far, the most important difference being that it now has
> only a single interrupt, compared to the previous SoCs having two.
>
> Let's add a compatible for that.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>

Acked-by: Chen-Yu Tsai <wens@csie.org>
