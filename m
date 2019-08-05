Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E51D816C0
	for <lists+linux-rtc@lfdr.de>; Mon,  5 Aug 2019 12:17:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727809AbfHEKRE (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 5 Aug 2019 06:17:04 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:45837 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727158AbfHEKRE (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 5 Aug 2019 06:17:04 -0400
Received: by mail-ed1-f67.google.com with SMTP id x19so72215223eda.12;
        Mon, 05 Aug 2019 03:17:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=x7vzN+j+SCe+XCO/mDoZK//BIz8w5B9jkGbWhEZ2u9o=;
        b=WlaoapMmZnjp8mcLqBEenzK05FDu7RqlMhmkMzan+HRQyDCoxoogN5om9Ok4v+Wwsy
         L+E1RI2pYijGKHQ1DKGpB9H0NAJrQIEhSZdUebeJbRZbz8MCz5KMO5ixyc0JBaPrIPW/
         n4Cnl+oWLCzMF06cKPThi2CkbKyxucpRuJU+7hVuMjW0PeEX/E1BXbqhu022ZKgU0B0N
         OMGRcFRJJPAQRYn8FWCnuSP+QEZ1JJXK1jYdhyyszBduRniXuj/yEDKZBLxq2Abf6BLm
         Pd0hRa/oXiCzx0Z+X0I4FxsC2A8/FCg23rnK7jYMKZd3i16JkgbWh+oqkTCLR0DbQdZZ
         UHPg==
X-Gm-Message-State: APjAAAWx0rxtH/ajoC/+xDfulsjk7tv5Xfjb9XZbcvzdS9dEZm+9+brT
        pkjtjvXIhlV1X4uUOMN9PQsGjjiPK9I=
X-Google-Smtp-Source: APXvYqw3pXH1LL7qYbar3sLuQKW3Hp4tiqc0y4NBFWEEV/+k/XkwhZVgRLihWx6qcdx+heVbYzbrKQ==
X-Received: by 2002:a50:a4ad:: with SMTP id w42mr129608157edb.230.1565000222594;
        Mon, 05 Aug 2019 03:17:02 -0700 (PDT)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com. [209.85.221.49])
        by smtp.gmail.com with ESMTPSA id l1sm19293419edr.17.2019.08.05.03.17.02
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Aug 2019 03:17:02 -0700 (PDT)
Received: by mail-wr1-f49.google.com with SMTP id p17so83802931wrf.11;
        Mon, 05 Aug 2019 03:17:02 -0700 (PDT)
X-Received: by 2002:adf:e941:: with SMTP id m1mr11300922wrn.279.1565000221906;
 Mon, 05 Aug 2019 03:17:01 -0700 (PDT)
MIME-Version: 1.0
References: <20190412120730.473-1-megous@megous.com> <20190412120730.473-2-megous@megous.com>
In-Reply-To: <20190412120730.473-2-megous@megous.com>
From:   Chen-Yu Tsai <wens@csie.org>
Date:   Mon, 5 Aug 2019 18:16:48 +0800
X-Gmail-Original-Message-ID: <CAGb2v65d=yXPEiyTv0X3m25mzd2J5DnrWvyxz0zjLiq997BbZg@mail.gmail.com>
Message-ID: <CAGb2v65d=yXPEiyTv0X3m25mzd2J5DnrWvyxz0zjLiq997BbZg@mail.gmail.com>
Subject: Re: [linux-sunxi] [PATCH 1/3] dt-bindings: Add compatible for H6 RTC
To:     =?UTF-8?Q?Ond=C5=99ej_Jirman?= <megous@megous.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        linux-rtc@vger.kernel.org, devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-sunxi <linux-sunxi@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Fri, Apr 12, 2019 at 8:07 PM megous via linux-sunxi
<linux-sunxi@googlegroups.com> wrote:
>
> From: Ondrej Jirman <megous@megous.com>
>
> RTC on H6 is similar to the one on H5 SoC, but incompatible in small
> details. See the driver for description of differences. For example
> H6 RTC needs to enable the external low speed oscillator. Add new
> compatible for this RTC.
>
> Signed-off-by: Ondrej Jirman <megous@megous.com>

Acked-by: Chen-Yu Tsai <wens@csie.org>
