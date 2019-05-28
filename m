Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C9EFC2BDE5
	for <lists+linux-rtc@lfdr.de>; Tue, 28 May 2019 05:46:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727386AbfE1DqU (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 27 May 2019 23:46:20 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:34470 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727320AbfE1DqT (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 27 May 2019 23:46:19 -0400
Received: by mail-ed1-f65.google.com with SMTP id p27so29584870eda.1;
        Mon, 27 May 2019 20:46:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cbIANbieB/ZMM4atu/fV00M4bGQeXLE4fKpqjXqbb1o=;
        b=uahHYiN8+ZlHAppYS5JNQ7avQDh6Q6e2tNVaBg5mSlmVmfYDNAIpy5PJl7QeuDAEe4
         1+9/N4Rjs2Lm+DRfwMM7lZ1F48GtCGRjwWs7CdbBa46QbQAJODPl69h1uF6W5OU3b3mC
         TpWpmuronHGeE9a2bIJPQBAKJK37HMU4991Z+9ZKVw1JfMiNof4Fo25kSs9cOPY/91s6
         58YRlgMy31iirOZawgGLITM/yYPQUyF39iS9pyAufEy0VNudp6BCnqzUTTzeOJIMHmPc
         6hCkAVqbSte6AdMcxG+WJACmRBGg9HVFbV0eIi3qmxJFhZhBPa1W/zWm02akfM6QmU3M
         LuCA==
X-Gm-Message-State: APjAAAX/YiBRBrLWeVPBo5gwIZtq57oyvC7K0jPpBVZuNbp8SleOXqEe
        CZ/v67RyRil5FGgZ2ej2dyIeyY8haZI=
X-Google-Smtp-Source: APXvYqxUABreGFC6WWDgWQmGIG3HlmJlVOC299I1WXL4FX17WlL/OwCJ3Hz+dE2gw7Oi6pTZ38aA8A==
X-Received: by 2002:a50:8ed1:: with SMTP id x17mr125850141edx.41.1559015177765;
        Mon, 27 May 2019 20:46:17 -0700 (PDT)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com. [209.85.221.46])
        by smtp.gmail.com with ESMTPSA id r14sm2024428eja.77.2019.05.27.20.46.17
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 May 2019 20:46:17 -0700 (PDT)
Received: by mail-wr1-f46.google.com with SMTP id m3so18539402wrv.2;
        Mon, 27 May 2019 20:46:17 -0700 (PDT)
X-Received: by 2002:adf:d4c2:: with SMTP id w2mr13821930wrk.167.1559015177086;
 Mon, 27 May 2019 20:46:17 -0700 (PDT)
MIME-Version: 1.0
References: <290402405a34506997fd2fab2c4c1486dbe6b7e5.1558958381.git-series.maxime.ripard@bootlin.com>
 <00f6de1a4e012d5ad9a4eef054d0e19d534f067d.1558958381.git-series.maxime.ripard@bootlin.com>
In-Reply-To: <00f6de1a4e012d5ad9a4eef054d0e19d534f067d.1558958381.git-series.maxime.ripard@bootlin.com>
From:   Chen-Yu Tsai <wens@csie.org>
Date:   Tue, 28 May 2019 11:46:07 +0800
X-Gmail-Original-Message-ID: <CAGb2v64ObC7vpm2_0FpoJcw9gGcbJidMy0MstTqcgbVf3Oib8Q@mail.gmail.com>
Message-ID: <CAGb2v64ObC7vpm2_0FpoJcw9gGcbJidMy0MstTqcgbVf3Oib8Q@mail.gmail.com>
Subject: Re: [PATCH 06/10] rtc: sun6i: Add R40 compatible
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
> The R40 has a quite different RTC, with only a single interrupt line, but
> two clock outputs. Let's add a compatible.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>

Acked-by: Chen-Yu Tsai <wens@csie.org>
