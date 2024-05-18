Return-Path: <linux-rtc+bounces-1199-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9188C9159
	for <lists+linux-rtc@lfdr.de>; Sat, 18 May 2024 15:14:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7BAA5B211A6
	for <lists+linux-rtc@lfdr.de>; Sat, 18 May 2024 13:14:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA8F53B298;
	Sat, 18 May 2024 13:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=btmindustrial.com header.i=@btmindustrial.com header.b="ePKkWttN"
X-Original-To: linux-rtc@vger.kernel.org
Received: from 5635498.btmindustrial.com (5635498.btmindustrial.com [162.215.218.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41CFD10979
	for <linux-rtc@vger.kernel.org>; Sat, 18 May 2024 13:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.215.218.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716038068; cv=none; b=aUI+4Mxf1A4TTJzKLL5nvHphNMDYHke/qEEX9/S4Y/ovChrV9qKRpIQDM0URKOSsKS4sa487Bdme55w9dk5R0f5dEaFkWACYeBH+pcCW9Y2MoMQgtDkZZYuVSd5BDXYJOgWGY7nt2PvFfwW9tlxO8bjZfc6bCBhp5j+gL0WtzMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716038068; c=relaxed/simple;
	bh=prydTSJomuOSaK1F8pm+CpThI/muxpTqHNJw8ri2S1w=;
	h=To:Subject:From:Message-Id:Date; b=ZnZosyFIU2/Qbbfct3G+XgNoLIeOMWs4YozGELBVJtl4iIXdLfl8bgHiBjCGRzoSacZBohIrU7gga6IzUxc8pnIL/we2uv0Zw11Q/tKoLj5ESlZRaaVyuw9E9QB+S+K3dBhQUg02c7nZS6BvxY2vorJlYHmSlCFJIR87bhjomaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=BTMIndustrial.com; spf=none smtp.mailfrom=5635498.btmindustrial.com; dkim=pass (2048-bit key) header.d=btmindustrial.com header.i=@btmindustrial.com header.b=ePKkWttN; arc=none smtp.client-ip=162.215.218.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=BTMIndustrial.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=5635498.btmindustrial.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=btmindustrial.com; s=default; h=Date:Message-Id:From:Subject:To:Sender:
	Reply-To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=MSwWR8pC4+BDrNyRK/qe/6PxQX2XcAnW7eHPGL8ogao=; b=ePKkWttN4ZzSt1mCZU3rG6wMXP
	z7PXoNjgQ0wLzPlOyT6ZzhraIxJUhAgFf1k//bs25ETdBrFGSJFvw9REW3H/LgBGE2ZLINitP+wh/
	h1gE+KAc3pSN2BlirkcRvOLrBpYQXAHajXXle7O1ZZlRGkWbAapVnvNWLF2XxFdyi3PXn17P+37Kr
	SkXlj6ZjuBzERHD8Mn8c4B4l+q4Glsm4eDfwry1zRF0mAFKigZuJKfCCMBfYzXLOUft1ip0Cfb1Yi
	0hUypAwVZy+uniQucqDW0ux6D1H/mrojDjKQBWPZSmTFC3lWOrgdTQYituqXZWZkWz6oKYHsgaHJJ
	BtfwvDyw==;
Received: from machinre by 5635498.btmindustrial.com with local (Exim 4.96.2)
	(envelope-from <machinre@5635498.btmindustrial.com>)
	id 1s8JLw-0005xN-0w
	for linux-rtc@vger.kernel.org;
	Sat, 18 May 2024 07:39:56 -0500
To: linux-rtc@vger.kernel.org
Subject: [Replay] I promised.
X-PHP-Script: www.btmindustrial.com/contactFormSend.php for 212.102.35.132
X-PHP-Originating-Script: 1004:contactFormSend.php
From: Surplus@BTMIndustrial.com
Message-Id: <E1s8JLw-0005xN-0w@5635498.btmindustrial.com>
Date: Sat, 18 May 2024 07:39:56 -0500
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - 5635498.btmindustrial.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [1004 991] / [47 12]
X-AntiAbuse: Sender Address Domain - 5635498.btmindustrial.com
X-Get-Message-Sender-Via: 5635498.btmindustrial.com: authenticated_id: machinre/from_h
X-Authenticated-Sender: 5635498.btmindustrial.com: Surplus@BTMIndustrial.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>

Thank you for emailing BTM Industrial. We will be contacting you shortly. 


 Email Submitted to Surplus@BTMIndustrial.com below: 

 EMAIL SENT USING BTM's website form.
Company: google
Contact Number: 84147919274
Heard about us from: Postcard
Other: Google
Hi, this is Irina. I am sending you my intimate photos as I promised. https://tinyurl.com/2adtalar#Pjla0r

