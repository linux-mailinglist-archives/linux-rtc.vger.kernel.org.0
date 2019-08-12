Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AD0618AB0C
	for <lists+linux-rtc@lfdr.de>; Tue, 13 Aug 2019 01:21:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726200AbfHLXV0 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 12 Aug 2019 19:21:26 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:36483 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726144AbfHLXVZ (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 12 Aug 2019 19:21:25 -0400
Received: by mail-pf1-f196.google.com with SMTP id r7so50474160pfl.3
        for <linux-rtc@vger.kernel.org>; Mon, 12 Aug 2019 16:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=g+l1+DGNELUOAq8cjxdJkWxhS0t5z7hND686YF94qa8=;
        b=r0ASmmilpv/FWZ7l/cQ2H+o3I3b7VzCxZKHWRWFFmeM1xUe4Z8TAViBrzPCMv2tCMW
         QfAXafIeqKxxZxwAFTArvKzroHrlEQKwZL869REw4ypPpAamqrJcjW+ldot7c3okYgB0
         E/M5qbir5PQMYxdsvgThXrIAQdu3C4lQMXmrDWZ/+TC6+2fnbAgkrFmhLuPtY265Kivj
         3PKRcJxnt4S4u0KCqR2tJpSv7jl0iHTJkEVp3U8af8RZOLFp9mGPv2Ivd+pSVJ+cuaeU
         lC8tttSeAU1OQKeH/+LHc3fJmVJOSZotUCaKmIKGcWjOakYL2yMk0EnE+ui0vY0JucGZ
         uA+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=g+l1+DGNELUOAq8cjxdJkWxhS0t5z7hND686YF94qa8=;
        b=hFLQr5hKF5Fvui3JgclcuW7jqT+SeDk8uslg8jrIgPQHG3Zi5KWxG5iQTM6gj/Hz9z
         PqzUvOHGTZIVVqx/PxL/fr5oh50Vht6O6GB8Y74pW88qo2vJU8VIfB4csfRP0ljljjuS
         EhKW7tupP/HU6VbKClPTmwSRFF7DI8fFsXEhjusMS0hmc5KZAh+ayks/zPMJuYI0/tU0
         CJ/zww2tX52gPCNjxlgSTpJZ9t4jPHwhJTLGLES+eOfFri9KPQf649unChMyWIBb2l7r
         hIoF02k21OjPVunmOTTwwZa572jncQJCCraisEGtDbzApWvDwaW8ecK6EBbJDqWJjqqO
         J9zg==
X-Gm-Message-State: APjAAAUnbzX/Nb7ACG9JieGY42kWWbv2IlZ1BbPL6zuo73pzM+hMxjxR
        0tYsjbiI6N0qHFuMcWUe81R3jw==
X-Google-Smtp-Source: APXvYqyyhI+uC5HceMN4J/VuKh52YYpjf5nScDIdktyKjduhHJqkAgfV5NDGXSujxj8llYASLi7Qsg==
X-Received: by 2002:a65:5043:: with SMTP id k3mr33102097pgo.406.1565652084961;
        Mon, 12 Aug 2019 16:21:24 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:14bb:580e:e4d6:b3a8])
        by smtp.gmail.com with ESMTPSA id o35sm100362123pgm.29.2019.08.12.16.21.24
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Aug 2019 16:21:24 -0700 (PDT)
From:   Kevin Hilman <khilman@baylibre.com>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Kevin Hilman <khilman@kernel.org>
Cc:     linux-rtc@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v2 2/2] rtc: Add Amlogic Virtual Wake RTC
In-Reply-To: <20190812211337.GW3600@piout.net>
References: <20190808042357.4663-1-khilman@kernel.org> <20190808042357.4663-3-khilman@kernel.org> <20190812211337.GW3600@piout.net>
Date:   Mon, 12 Aug 2019 16:21:23 -0700
Message-ID: <7h7e7i0y30.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Alexandre Belloni <alexandre.belloni@bootlin.com> writes:

> On 07/08/2019 21:23:57-0700, Kevin Hilman wrote:
>> +static int meson_vrtc_probe(struct platform_device *pdev)
>> +{
>> +	struct meson_vrtc_data *vrtc;
>> +	struct resource *res;
>> +
>> +	vrtc = devm_kzalloc(&pdev->dev, sizeof(*vrtc), GFP_KERNEL);
>> +	if (!vrtc)
>> +		return -ENOMEM;
>> +
>> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> +	vrtc->io_alarm = devm_ioremap_resource(&pdev->dev, res);
>
> You could use devm_platform_ioremap_resource.
>
>> +	if (IS_ERR(vrtc->io_alarm))
>> +		return PTR_ERR(vrtc->io_alarm);
>> +
>> +	device_init_wakeup(&pdev->dev, 1);
>> +
>> +	platform_set_drvdata(pdev, vrtc);
>> +
>> +	vrtc->rtc = devm_rtc_device_register(&pdev->dev, "meson-vrtc",
>> +					     &meson_vrtc_ops, THIS_MODULE);
>
> Please use devm_rtc_allocate_device and rtc_register_device.
>

OK, will update both and send a v3.

Thanks for the review,

Kevin
