Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 756D12BDC7
	for <lists+linux-rtc@lfdr.de>; Tue, 28 May 2019 05:35:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727547AbfE1DfM (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 27 May 2019 23:35:12 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:44759 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727320AbfE1DfM (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 27 May 2019 23:35:12 -0400
Received: by mail-ed1-f67.google.com with SMTP id b8so3590515edm.11;
        Mon, 27 May 2019 20:35:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=A9CIrpgRhuz18hiUy1qjEgrlpmt04SJ5EW+pY8QJCHk=;
        b=WAN4MkmjQJiSH2XlKidN23LLEnpuDvliNGcYEvJbWV4qDZQR/7imNGdwBAbRtdU6te
         7LFRpdp7ZvAaJPXHnfzDWq9EMqYlvVIQ/RgQ65NwyzIJLtVFwUa6MdMqqC7NZ26JdZfC
         3sdBHkRpzV1VyIi1n2M0YvfW/uj98GfkXWyd7Q6xHZY39xHhN3j0L6pSvQC6RIhlWHr7
         kMi4WD6OuOChR2mS+omzUg0cYTpcoS0FhuKH6mBqnCaRdNYw9uvU9vd6KHOHb1+ieoxe
         8SZg8nhLPVS8jZ6kr7/2mkeqjdtjOkAKgfAwgBjAEc2VHQB2a1fNFY7JOopQcZfvXFAO
         vSCg==
X-Gm-Message-State: APjAAAUJYjf+UpV1QHpvDm6GVqJ+k+jR3TgQYkAjibCCEgHfX4ZyKied
        65NkdbUx++TPktElzq69RTeBvU0Ily0=
X-Google-Smtp-Source: APXvYqzdty0dQF0BdTiRugUVU82Qe0z5A69A4RjVJcGjpahp7b368YCR+c+w9PGQG/3fXIOeVHnIQA==
X-Received: by 2002:a05:6402:54a:: with SMTP id i10mr127031270edx.162.1559014510512;
        Mon, 27 May 2019 20:35:10 -0700 (PDT)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com. [209.85.128.41])
        by smtp.gmail.com with ESMTPSA id h5sm3854951ede.74.2019.05.27.20.35.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 May 2019 20:35:10 -0700 (PDT)
Received: by mail-wm1-f41.google.com with SMTP id y3so1152632wmm.2;
        Mon, 27 May 2019 20:35:10 -0700 (PDT)
X-Received: by 2002:a05:600c:3d0:: with SMTP id z16mr1392683wmd.125.1559014509915;
 Mon, 27 May 2019 20:35:09 -0700 (PDT)
MIME-Version: 1.0
References: <290402405a34506997fd2fab2c4c1486dbe6b7e5.1558958381.git-series.maxime.ripard@bootlin.com>
 <0b46e2c493cdab00ceef6e35dfef0cc869f14fa3.1558958381.git-series.maxime.ripard@bootlin.com>
In-Reply-To: <0b46e2c493cdab00ceef6e35dfef0cc869f14fa3.1558958381.git-series.maxime.ripard@bootlin.com>
From:   Chen-Yu Tsai <wens@csie.org>
Date:   Tue, 28 May 2019 11:35:00 +0800
X-Gmail-Original-Message-ID: <CAGb2v64GQsq43kd+fJ+ynFXwD+VjCKOQTY8Xz6wEaZxd0rR0bw@mail.gmail.com>
Message-ID: <CAGb2v64GQsq43kd+fJ+ynFXwD+VjCKOQTY8Xz6wEaZxd0rR0bw@mail.gmail.com>
Subject: Re: [PATCH 08/10] ARM: dts: sun6i: Add external crystals accuracy
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
> The A31 datasheet mandates oscillators accuracy to be within 50ppm. Let's
> add that accuracy to their device tree nodes.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>

Acked-by: Chen-Yu Tsai <wens@csie.org>
