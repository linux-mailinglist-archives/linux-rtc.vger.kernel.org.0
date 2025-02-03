Return-Path: <linux-rtc+bounces-3085-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D83C1A258D1
	for <lists+linux-rtc@lfdr.de>; Mon,  3 Feb 2025 13:00:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 388D2167880
	for <lists+linux-rtc@lfdr.de>; Mon,  3 Feb 2025 11:59:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BD5A2066F4;
	Mon,  3 Feb 2025 11:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UY++Gbq5"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13A8204090
	for <linux-rtc@vger.kernel.org>; Mon,  3 Feb 2025 11:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738583774; cv=none; b=l4vijwI36MeegGVAlTwSewB780j/Ss/fuB1raptZUqss1rZqz7QFk77fk4umL5OhsKr88lbXgTugXtazs6Izhg7ovCR6J6S8H+CAMV2OE0pneTSnzFoVSRLVt7+CDVfbRXBMcjqgFabowGZFQsOAGgUFm6RyoyoijX9SGRHDbAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738583774; c=relaxed/simple;
	bh=5VO8qxHdPv1GlCfSqdK9sL6Lqc78mt2FtDInjR+r4xE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=t5dr48EiZ6E2OWfvrnPnYNfml9YBq6oLfEDFZd1xhRLaoE5ig8bmOog9k934AjI6vzb3rlF5ecO7u3v4SjxocUC6nOLPRI9LyJkXXjrUqAlHBE+zyNLJUe8an68kO4mtpNiGl/kjhtr0UlZZDxoXKMqDL+OQK04WR+I/HQ4FX9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UY++Gbq5; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4363299010dso5645355e9.1
        for <linux-rtc@vger.kernel.org>; Mon, 03 Feb 2025 03:56:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738583770; x=1739188570; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hf+nXVuq0n7+9Hzbsc1pHZN283D6/tls331wlf2T5UA=;
        b=UY++Gbq5oALjic2kiOL6Y6hx3NYz7TLaTEuDiFgSUfyOd/d5KoeixoJEi0gmy8Bpbd
         RAc4vqJkhwL+BIrCT1teZYSX0kEof3cFT61U1ZL9GDqTE3x8qfK5+g33EddyXkzCmIgI
         QakZntsvRsbN8TyFRl2O43OKnHuPTskB/5702h5bZzjupoHlZmIKHY0YBljxaGrWmyzi
         povy+oQIk3MeQthGJj91UNlkbLdn8blPqaJL8EPoJPCgqA6SpNkV1k6WZQF8oiuKqxIk
         DHDge6l9jKS6mn+ZFPQgW2O5oQl2tzP5BGeAHVj138Sv3onnk/MA9UL7qVu5ghlT73K8
         KM2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738583770; x=1739188570;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hf+nXVuq0n7+9Hzbsc1pHZN283D6/tls331wlf2T5UA=;
        b=qXtx1kTygUjJQaWyBo80jyYRxUyCI1v3ALWPdC67xqP0DegWhPqoO6AG8aHhh0FCch
         cQFh5rxXun7OWYgjh25FS2Ig1DLI/hcriTac+/io+JkLHqjmPnIDKL+Agwe0NorfFpXu
         crkhWhIk4DZCZJb/9AGIhmD5oJkHYAdvxkI+Of7d2qRkJ1k3nTMgHxoByykzyGhxTmBb
         zaDj698Vn4qZbi3E/N2Gg+htm1awtqLL+JBZtcbq7k5oo73g8rYr9CZ0oeE5xuzgXkz+
         j0piw/hPY8Fp/FitDR/IKTskE/XSqSjIUPErknWMtXBUtPSQ2QGYz9MtJBX+f2XQcMV3
         T4dQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZLqhe9mIoMnQGtXwrRBz2XfHzVLuIZtUdVp8JcCf9Dkc7RgJ0R0n2PIAX7jdOEYxmPK6eGmrDf8Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc/icRTtKwHIsNI2q+5FvK5+NK4VMnffPIjM2lsdfYEdlCgKiR
	59cQbAVf2sem6nRxjJmxTu049sucX/kXRR5y5ZCqRG/mnyz8L06G5HoKcetpMJXcX+QnTx7sn3h
	Y
X-Gm-Gg: ASbGnctE0isBlxFpzy7q/CJC/SiddoVa40cItTyfRO84JEcyCwZuE1Z/f+twIBFm0zj
	hmI2+vfc82w9ZDxYXSbEYfEV5y9rjnEWktgtK1OuwBH6kCA4Cp0fL2b0HeYy4+dzm+SYSzKPIZA
	vGbbwrujIJOmVn5LaWl6tKWVH5SGFP5jPZmLYhNWCBQnxIywCiokj+eiCO5iIoc0+iV/LC1g6g+
	eqI3gLlb/RYiyEI5ilq4jhYJddLMkIC1/c009m9Ly1wursNYqB82LQ+FbHNJHEBa/phNfVl3sYu
	bzLoJsv8G1k2ilj9y5NeXo2EHgtkK6o=
X-Google-Smtp-Source: AGHT+IFQbSU80i6YQYi6YzPYyBsllYWbDkIcbgELZu/FC2dJYOz3ZShx5Senfvr4yJ63Nm+XoGt8PA==
X-Received: by 2002:a05:600c:1994:b0:434:f5f8:22cd with SMTP id 5b1f17b1804b1-438dc331eb2mr74266625e9.0.1738583769775;
        Mon, 03 Feb 2025 03:56:09 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438d7558ba2sm166790545e9.0.2025.02.03.03.56.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 03:56:09 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, netdev@vger.kernel.org, 
 linux-rtc@vger.kernel.org, Huisong Li <lihuisong@huawei.com>
Cc: oss-drivers@corigine.com, matt@ranostay.sg, mchehab@kernel.org, 
 irusskikh@marvell.com, andrew+netdev@lunn.ch, davem@davemloft.net, 
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
 louis.peens@corigine.com, hkallweit1@gmail.com, linux@armlinux.org.uk, 
 kabel@kernel.org, alexandre.belloni@bootlin.com, krzk@kernel.org, 
 zhanjie9@hisilicon.com, zhenglifeng1@huawei.com, liuyonglong@huawei.com
In-Reply-To: <20250124022635.16647-9-lihuisong@huawei.com>
References: <20250124022635.16647-1-lihuisong@huawei.com>
 <20250124022635.16647-9-lihuisong@huawei.com>
Subject: Re: (subset) [PATCH v1 8/9] w1: w1_therm: w1: Use
 HWMON_CHANNEL_INFO macro to simplify code
Message-Id: <173858376808.132674.4568544450122043067.b4-ty@linaro.org>
Date: Mon, 03 Feb 2025 12:56:08 +0100
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Fri, 24 Jan 2025 10:26:34 +0800, Huisong Li wrote:
> Use HWMON_CHANNEL_INFO macro to simplify code.
> 
> 

Applied, thanks!

[8/9] w1: w1_therm: w1: Use HWMON_CHANNEL_INFO macro to simplify code
      https://git.kernel.org/krzk/linux-w1/c/33c145297840dddf0dc23d5822159c26aba920d3

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


