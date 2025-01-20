Return-Path: <linux-rtc+bounces-2952-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 408C2A16B18
	for <lists+linux-rtc@lfdr.de>; Mon, 20 Jan 2025 11:57:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7B4AC164097
	for <lists+linux-rtc@lfdr.de>; Mon, 20 Jan 2025 10:57:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED9B61B87DB;
	Mon, 20 Jan 2025 10:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="epuezM5O"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47DC0187872
	for <linux-rtc@vger.kernel.org>; Mon, 20 Jan 2025 10:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737370633; cv=none; b=Ob3ls/EBFxxm3C3mwhULuK8Lc8K1XK7H++DOvjZseNoK6J1Qu44Ywl7JOdnu4eeWcUOSQaGsDdHpgQ+HC4nEsbHv8Y83yXZFIoS2wk8NLILmgW0kZcYPyMEiLQ7jepQpntWlaUocnDAGl7pR/9F2Ss6OQ9N9s7NnyZP/Pz3V24Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737370633; c=relaxed/simple;
	bh=hlbVUse1kdyH7T+j1cXIhKPxXlagveeorWZyug3mE/M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X6fe8jV42090zN3P81sm9mdxwaFRvqDboAgPS5I2f7346P4XyBApCg1m4TNcV/WhZgBrRHj3IMylS7eGRpl7HefhK01mKKkyPFhq65RtQIU6Gg3C9ynIlO8VQOLIdb+ygLajNNGS0Lrk9LitFpf0HobTLkFVM3eKgvGz3AnJXDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=epuezM5O; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4361e89b6daso29440335e9.3
        for <linux-rtc@vger.kernel.org>; Mon, 20 Jan 2025 02:57:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737370629; x=1737975429; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZnCt5DjDOmwR4I1vAJ/enzzSs6/BjfG1IINpOsDqGQc=;
        b=epuezM5O+vv7k5klavkWOWcY9eDWFTGY10QTZewjv4Q+LeW3J5pOQxeIWtAu38KGSC
         Ycfc4kt5h4KlU/5a0thQX94m6Uj+7QsNIcUdGq3j3CfOk8TalIdGwcD0xiBVjL/fsUO4
         kjyrpRYuu7es+FN+0BVUA6bzG9Ut3g5zcXbQERFQ/GzLHeAUSTQ/FQwhtlTR7aJ/BqF9
         rph/YWienhn2B5R89UquAhsA6WUdLUrVeDnjETB+tA1E/MMFF9qzHNqQtNBRn7PDdLth
         H/IwBNuGR6xax6g+4YMqgABdg3seyXQ7UjGOO8tkMesT8bJjM0egQiK9tDwdk7xlRsPh
         6cYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737370629; x=1737975429;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZnCt5DjDOmwR4I1vAJ/enzzSs6/BjfG1IINpOsDqGQc=;
        b=lIFk6f05Zg8DM2/2ka4BizdOhzVmOXWY4RfBchW8gruAc2Q3lc8NLfvntOi8xwlYyM
         ixB0t/jMXLD05vLQ0gE3gfNr3sRCO4sO+jp+Xl6Yz2QHYQ6lKe2e/iiA/uVTAOdo4ov8
         TUMDohUZAxSmM3o7WZg28YnyG3ru4uBeswaknCVg7mqdMzR/HEDMps1jyhos7wiB0kAF
         H+/FxLh5YJ8+64DT0s4/1K8MSLvrd0UKz8+Tm/XA57NUPLjOL03yA7E5+CgVZz2CL32j
         v74CS+FPJYT3UM8WsH81GjSCTmZuuqUqG4YrY3PX3ZrhZq/xJ78poXdSRD0aCB4LIoNE
         t3AA==
X-Forwarded-Encrypted: i=1; AJvYcCVTtSaeNV9d/54B9UtkhhYvO49Xlr8zZcaX5jARBhzAsL+2UpGMILvsVsVZKLU4uzjn/re0SXkSQyw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy54HfdzLc8uMJoNkh04kTzshYZTUnrzFNcNXr5HSkSi9JD8evA
	bAQTYQ1H8JZyFDUlfGF5bJ3UDQnnoQbXnKpQnHEakcGRkgdMaLWtbL4Q/1V3JDA=
X-Gm-Gg: ASbGncuYOkAABW0gZuyIMj6OksDeKGxdwqK8knXPB99QXU+fWb+Xk+aJD1UMnbqLMpz
	2VkOK4+tY8I48anMHwRYFjOoVg4nrClBuS7F15J/cdcu42EAPVjlkUVo193XV27dNsh/fqwhlqW
	ChhcuHXO8nsVgmakADc8ih6PrBK9izHJ/UMT9IDUFGEPRx3OT6a/VeYrY0pic9BkljdEFH1MR55
	HsMljOtM+5ZnVNxpCLdcn7Bu2iObUqo75cnsPATyCS0/wW9joUWaylAmjhQ+de/xwti91O23fQ=
X-Google-Smtp-Source: AGHT+IFcWdDkIWIV3+3k8GBszP8VeZU7+D+s8s4XaEHc4R+KN6tCXBGU2C0qdKTOyDm73nBXW992qw==
X-Received: by 2002:a5d:4b48:0:b0:38a:41a3:218 with SMTP id ffacd0b85a97d-38bf57a2612mr7545183f8f.36.1737370629606;
        Mon, 20 Jan 2025 02:57:09 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf3221b7fsm9969683f8f.27.2025.01.20.02.57.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 02:57:09 -0800 (PST)
Date: Mon, 20 Jan 2025 13:57:05 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 3/4] rtc: Introduce devm_rtc_allocate_device_priv
Message-ID: <a0403834-1c2f-42b4-81f3-ca4123fd2a4e@stanley.mountain>
References: <20250120-rtc-v1-0-08c50830bac9@nxp.com>
 <20250120-rtc-v1-3-08c50830bac9@nxp.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250120-rtc-v1-3-08c50830bac9@nxp.com>

On Mon, Jan 20, 2025 at 10:25:35AM +0800, Peng Fan (OSS) wrote:
>  int __devm_rtc_register_device(struct module *owner, struct rtc_device *rtc)
> diff --git a/drivers/rtc/dev.c b/drivers/rtc/dev.c
> index c4a3ab53dcd4b7280a3a2981fe842729603a1feb..e0e1a488b795645d7c9453490d6cdba510cc5db5 100644
> --- a/drivers/rtc/dev.c
> +++ b/drivers/rtc/dev.c
> @@ -410,7 +410,8 @@ static long rtc_dev_ioctl(struct file *file,
>  		}
>  		default:
>  			if (rtc->ops->param_get)
> -				err = rtc->ops->param_get(rtc->dev.parent, &param);
> +				err = rtc->ops->param_get(rtc->priv ?
> +							  &rtc->dev : rtc->dev.parent, &param);

This seems kind of horrible...  I can't think of anywhere else which
does something like this.

It would almost be better to do something like:

	err = rtc->ops->param_get(rtc->priv ? (void *)rtc : rtc->dev.parent, &param);

The advatange of this is that it looks totally horrible from the get go
instead of only subtly wrong.  And it would immediately crash if you got
it wrong implementing the ->param_get() function pointer.

regards,
dan carpenter


