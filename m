Return-Path: <linux-rtc+bounces-4979-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E950B83E73
	for <lists+linux-rtc@lfdr.de>; Thu, 18 Sep 2025 11:49:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 00A9B4A2715
	for <lists+linux-rtc@lfdr.de>; Thu, 18 Sep 2025 09:49:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FB1E2F5A0B;
	Thu, 18 Sep 2025 09:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nmXz/eGo"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51FCB27AC4C
	for <linux-rtc@vger.kernel.org>; Thu, 18 Sep 2025 09:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758188926; cv=none; b=nKTVhBnBCwI74CQv+tbEb88JKxUx/vwQ5LcgnHyGcE4g5jrnSBsRtmdU6V8npPnWzWAoI4MH0MLzTAcakCZkfmR0085UsBHbwo10wJfFOJRR3RhWDk+kum0iGRXs8s7P7H0SdHnDUmDd5eIeRs/9OwJcp3fJ/x/SovayMl33w9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758188926; c=relaxed/simple;
	bh=0C7LmroulnQm3ejlkogQJtKgQjdt7LnVORSSrGcSY6M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Pde6t7TXUDctpqowl8pta9ia+uERsh0SqySig6bICSDQcsQEVcpekf6KYjn6SyEKkVjnswI1xB7H/znjRZ6LxeOs5UAva569wO3oJdxMWlE4c8XeRpi3RJvrFu10wVBcMtCNCSynR2jL1mIrK0CYcYtGSAKCU0GBXBIpThWZOKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nmXz/eGo; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3ebc706eb7bso354779f8f.3
        for <linux-rtc@vger.kernel.org>; Thu, 18 Sep 2025 02:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758188923; x=1758793723; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=06wbCj7T4/WJAogV/vIy3oYzYPcgpMS/viJuMyneRkM=;
        b=nmXz/eGoYf3IJ/4rN7s3G3sW12bGAzTbpcSGkRw8glQ20aBAtOgn+M/X7YWFNsEljw
         t0Pd+jDKk48mWknMzslmUpvLrvQoxtfj8f2Q1E1QobHASJ9FdcomGkYFy5e6hDKH1LEE
         AzX1IccPZhXPgmtQxLld3c7NvNhbhc137LdQsVfxsNUiZEAplxpMrgi2G/DTAQElqJ1w
         AcZVL+D5IFSmkc3vyeWAyfhq4R8WVxoSEFyH/1HQN5qwqCgA3hVjp9/K9brGjkdzQEcb
         TwC4U5SxuzivjVIydlOemRzjkzuOto8SsNkax5iHog+4iXcxIkIsG8uoR6PBFgPz/ONW
         uVmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758188923; x=1758793723;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=06wbCj7T4/WJAogV/vIy3oYzYPcgpMS/viJuMyneRkM=;
        b=mCi/tFK1Wq7VDg3dI/Amg2ct0Rrxf8l90D6R/Xm5W/8WTtm/fkp1ccdBVnJq892Mmw
         pPSK3EGBJcp0yCUQiKLN5rRlFfxEiXO/C/KsQOqUvkJLSnxijO+fZ72o0yOVyuWaqv1f
         fYfw1R0wDafSTwEKTQWnjskOFXeE6K8EdELtjng3726Ikg7pijJro2mIjZV6MU8BYC5k
         akUV6rCbTRkuseCMq8Tvh302N7iVj2zR3KrbQ/lnSOfq4Ucpv44JSikRY+q/qCgvU3Ip
         OCDe3S5/Dc5/QUKfCjLOTmBwTzHX9I20uFc5B7SLxnlPDXV/ps0OKzr1vUVJsK3EtbH3
         gFbA==
X-Forwarded-Encrypted: i=1; AJvYcCXTeVzqNKXtjXPH+XuXBKjsP0PKaj4CWx3ID/jArAMz6mNlKah87FXa/SEf1TOFMx36ldBFeK8uCQo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgwagwSuQPdb5vuEnJ4oiFx+xoZZKqWH81Eg47M8JzjctLnfo2
	w5WcVy8S+gmV2TSV7+7QVWxdidjUOjpId+UyhuEMUpF4RzL2oEsMQCDgjdmpyMgVdjE=
X-Gm-Gg: ASbGncuFSG1uMXjTOeISTb+3dmu1hKM/URMBDKxCUSOMIs0sDzggXeMcs6dP3DIp9lJ
	ys1DR1hOu5G045IAf3A9qRAnCFuvNSk27OLXGINbQx5aonp1GElM1XnMkZNCMO3hLlGteCp8QLf
	pcySj6LGrZ7JzYZGts6bNx+6Oj+ra3Hx9c/OsRjkjJuFRthvko6k0QtbinU91HBTW97Tj26VyDf
	D9Xj/l9Dv8mrEg03SbQ1k84LIBFCbpMqCxXTP5MK+u+ei8vcevhy5uYCSjxKl6OtYWaYbkM2PEY
	QPc61A1//dC1oeZZD0YDZBDspQuwt6MP6HNCArBGMJxXUArkGm17fic9QorblYSxr3up4rkN8+z
	O6zhqE/6VB7yN6z9gbOcyg3nfkTiBdM4GR+Vb4m6Jei0/gg==
X-Google-Smtp-Source: AGHT+IHsyTQToKrNv/Eu1x4jWbOyj18f48ucisBaG0sk965vANcxGhm40GwNlwjKITJGgWyx59hCAw==
X-Received: by 2002:a5d:508f:0:b0:3ec:e226:d458 with SMTP id ffacd0b85a97d-3ece226d48dmr3029498f8f.0.1758188922699;
        Thu, 18 Sep 2025 02:48:42 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-464f5a281f1sm33543215e9.17.2025.09.18.02.48.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 02:48:42 -0700 (PDT)
Date: Thu, 18 Sep 2025 12:48:39 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: =?iso-8859-1?Q?Cl=E9ment?= Le Goffic <clement.legoffic@foss.st.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>,
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: [PATCH 0/2] rtc: optee: Fix a couple error codes
Message-ID: <cover.1758182509.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Fix a couple error codes detected by Smatch.

Dan Carpenter (2):
  rtc: optee: fix error code in probe()
  rtc: optee: Fix error code in optee_rtc_read_alarm()

 drivers/rtc/rtc-optee.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

-- 
2.51.0


