Return-Path: <linux-rtc+bounces-1198-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2D28C9152
	for <lists+linux-rtc@lfdr.de>; Sat, 18 May 2024 15:05:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 235E11F21B81
	for <lists+linux-rtc@lfdr.de>; Sat, 18 May 2024 13:05:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8C292BCFF;
	Sat, 18 May 2024 13:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=btmindustrial.com header.i=@btmindustrial.com header.b="GE71+Jo7"
X-Original-To: linux-rtc@vger.kernel.org
Received: from 5635498.btmindustrial.com (5635498.btmindustrial.com [162.215.218.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB18376E1
	for <linux-rtc@vger.kernel.org>; Sat, 18 May 2024 13:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.215.218.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716037537; cv=none; b=MBwe6DP0fdxr0fJGRk4vtyLPJudVouWsszg4efpum+VQvhMHiqzo7hF+O7oAyvVfnggzVlcqku5Fm48gsCMNWG/ra0IU5Ljn+TT2fLbN1dxgXspJSYtAkXVEobbLcbTCFgXgii9OizaaSN8yDo/YJTdSDu751vkoIN3AIJnIB04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716037537; c=relaxed/simple;
	bh=gUxcMQOLkkjthINtr1CzfzdYkT8M0q5nP9Qp3JIQQTQ=;
	h=Date:From:Message-Id:Subject:To:Mime-Version:Content-Type; b=jmbydP1a7eMQzkBLRgT4U8Isd1ouNe1k6WEguZmjK2L3qc8tEFwm/nPqe4yMzzvbNfYrO1r4faIx73P+T5FMAQbpXFzAKP0HCJW0vTWgzSi6rIJCr3NI/mrynXmUqxfqptsaGhzdzMduoDBi/lgwGDlN5e7jqn0GZkza0ApE8dU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=btmindustrial.com; spf=fail smtp.mailfrom=btmindustrial.com; dkim=pass (2048-bit key) header.d=btmindustrial.com header.i=@btmindustrial.com header.b=GE71+Jo7; arc=none smtp.client-ip=162.215.218.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=btmindustrial.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=btmindustrial.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=btmindustrial.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	Mime-Version:To:Subject:Message-Id:From:Date:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=gUxcMQOLkkjthINtr1CzfzdYkT8M0q5nP9Qp3JIQQTQ=; b=GE71+Jo7648u5KmYIUfVsEkoeO
	XJoz/+a/lwO2PElxBxeAsz2CqJ0XI3lNZuHeP2QGGFePq4qUiDtHzbCn+MDH3ilYwrP3QwNHD6KF1
	tqirsxz5GYhpPrkr50B+2SCV8WK0SJ6b99C/08W3pnIg/bMtyRpalRBxYahklReofJyyEFl68tuFB
	98m4VJ7BJq2F3vjXdm0Ef0sQALqZOk7kKkDFpHfSByZh0+nipLjqq6zST+pvHNYvlxhe+z85CZYwo
	xm3Cn6+tLm1/IXU7n/hMOkVxSZww9aypM6LmUvbQGlCQK4Wt/Ykk4CR1WxTqE1WX7CVsztKCmyq+y
	neUru6rQ==;
Received: from machinre by 5635498.btmindustrial.com with local (Exim 4.96.2)
	(envelope-from <surplus@btmindustrial.com>)
	id 1s8JLy-0005xo-2K
	for linux-rtc@vger.kernel.org;
	Sat, 18 May 2024 07:39:58 -0500
Date: Sat, 18 May 2024 12:39:58 GMT
From: "BTM Industrial Corp." <surplus@btmindustrial.com>
Message-Id: <1716035998.ekcJMHsxQAWkB8wc@5635498.btmindustrial.com>
Precedence: auto_reply
Subject: Thank you for your email.
To: linux-rtc@vger.kernel.org
X-Autorespond: I promised.
X-Loop: linux-rtc@vger.kernel.org
X-Precedence: auto_reply
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - 5635498.btmindustrial.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [1004 991] / [47 12]
X-AntiAbuse: Sender Address Domain - btmindustrial.com
X-Get-Message-Sender-Via: 5635498.btmindustrial.com: authenticated_id: machinre/from_h
X-Authenticated-Sender: 5635498.btmindustrial.com: surplus@btmindustrial.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Hello,=0D
=0D
Thank you for contacting BTM Industrial Asset Partners, your inquiry has be=
en received and you will be contacted by a BTM representative shortly.=0D
=0D
Thank You,=0D
=0D
BTM Industrial Asset Partners

