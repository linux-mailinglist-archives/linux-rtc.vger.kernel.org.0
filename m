Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7C749A179
	for <lists+linux-rtc@lfdr.de>; Thu, 22 Aug 2019 22:57:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392333AbfHVUwW (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 22 Aug 2019 16:52:22 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:42547 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388241AbfHVUwW (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 22 Aug 2019 16:52:22 -0400
Received: by mail-pf1-f196.google.com with SMTP id i30so4761045pfk.9
        for <linux-rtc@vger.kernel.org>; Thu, 22 Aug 2019 13:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=3HAkNaLKaKugwacngOASUf+k6kAzcSQJHy2ytCwReZ8=;
        b=TfQcqPfStJ1Rc3oSQUxvkEqRBWDG9HKn7JCy2rHB5DN0PuVo/2rm7AkYB8v9zhwt32
         7WxgzDMUPZj8OrdgQWjlr/FftrFxJen5gmu+Bnh1qhCqZZVzGkKbP8Yb9Jf+9qS2t7tC
         etwh9sY2nf6bNxA8LercsqvFOB2Ad8OcLTPuJ6TCW8HwE0shfXidPqYTYTNXsF/SPjsv
         ztsUptGKPjzuyXnfDzqkJPe+44MPYZ/QK6vHYuqrF8n/3K4ZB09hfECawcU/T7Uv/QR9
         tBa7DNzGDRl5CnwWKSufuPdoyH9M7XxrnEbNzA6ruBUBpHFR1r0/HJBQavqLY75s9EMn
         6hNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=3HAkNaLKaKugwacngOASUf+k6kAzcSQJHy2ytCwReZ8=;
        b=tJGaiec6+2KqiXk4vSYc8xq18F49cF62IZ0PSAWZPZqu+r1xx05kskK2wbixQh/ZAQ
         iLOQ/zhBOhMCWwQ5tyIlTDlgzt1HmjUd/lPt/xo0pSCNgH9Gh4jJGKxLqmgPo6Fgsn1N
         64gfnjEunYXPxxVRBpuNjsQ7egBUvMe6HCLdMrFhDY5XB+mxc4mT2kWbvZLy28fp8T0r
         mX+c6b1mK+ScEQws87w0aFfB22fXqQoTYm1V/UjPrq3mPUNhjEXVGHbORN4dyE5WEHLG
         Ac57o9wHPBynZcEl/Th+wqIMCEHRTcYUCHCz1z830eGTtW8dhCBroT0rCbUbqK+aPPN+
         Mxmw==
X-Gm-Message-State: APjAAAWq53XXy4Hx5JG86sr9sYtahB/WoNZARXcdFWu3dBn0VB/wog5L
        hvvA6qYcp+9l5vu9ofZBry9wBg==
X-Google-Smtp-Source: APXvYqzbl0kNpLZ+an5214np92JENAgAW5dpKMeExC3ZhPt55rlZOMPNBuMztgy7PcT8TrcTTerpjQ==
X-Received: by 2002:a62:4ed1:: with SMTP id c200mr1221517pfb.218.1566507141310;
        Thu, 22 Aug 2019 13:52:21 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:89d4:68d1:fc04:721])
        by smtp.gmail.com with ESMTPSA id e24sm174155pgk.21.2019.08.22.13.52.20
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Aug 2019 13:52:20 -0700 (PDT)
From:   Kevin Hilman <khilman@baylibre.com>
To:     Kevin Hilman <khilman@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org
Cc:     linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Neil Armstrong <narmstrong@baylibre.com>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v3 0/2] rtc: add new Amlogic Virtual Wake RTC
In-Reply-To: <20190812232850.8016-1-khilman@kernel.org>
References: <20190812232850.8016-1-khilman@kernel.org>
Date:   Thu, 22 Aug 2019 13:52:20 -0700
Message-ID: <7hmug03ou3.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Kevin Hilman <khilman@kernel.org> writes:

> From: Kevin Hilman <khilman@baylibre.com>
>
> Add a new driver for the virtual wake RTC on Amlogic SoCs.
>
> The RTC is virtual from the Linux side because it's a hardware timer
> managed by firmware on the secure co-processor (SCP.)  The interface
> is 1 register where a wakeup time (in seconds) is written.  The SCP then
> uses this value to program an always-on timer.

Just FYI... this was originally tested on G12A and G12B SoCs, but has
now also been tested to work unmodified on the new SM1 SoC as well.

Kevin
